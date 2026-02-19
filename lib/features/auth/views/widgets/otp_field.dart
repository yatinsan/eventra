import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPField extends StatefulWidget {
  final int length;
  final TextEditingController controller;
  final ValueChanged<String>? onCompleted;

  const OTPField({
    super.key,
    required this.controller,
    this.length = 6,
    this.onCompleted,
  });

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _controllers =
        List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());

    widget.controller.addListener(_syncFromMainController);
  }

  void _syncFromMainController() {
    final value = widget.controller.text;
    for (int i = 0; i < widget.length; i++) {
      _controllers[i].text = i < value.length ? value[i] : '';
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_syncFromMainController);

    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }

    super.dispose();
  }

  void _onChanged(String value, int index) {
    // Handle paste full OTP
    if (value.length > 1) {
      final characters = value.split('');
      for (int i = 0; i < widget.length; i++) {
        _controllers[i].text = i < characters.length ? characters[i] : '';
      }

      widget.controller.text =
          characters.take(widget.length).join();

      _focusNodes[widget.length - 1].unfocus();
      _checkCompletion();
      return;
    }

    if (value.isNotEmpty) {
      widget.controller.text = _getOtp();

      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    }

    _checkCompletion();
  }

  void _handleBackspace(int index) {
    if (_controllers[index].text.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
    }

    widget.controller.text = _getOtp();
  }

  String _getOtp() =>
      _controllers.map((e) => e.text).join();

  void _checkCompletion() {
    final otp = _getOtp();
    if (otp.length == widget.length &&
        !_controllers.any((c) => c.text.isEmpty)) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 50,
          child: KeyboardListener(
            focusNode: FocusNode(),
            onKeyEvent: (event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                _handleBackspace(index);
              }
            },
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) => _onChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}
