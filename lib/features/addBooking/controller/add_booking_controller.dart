import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddBookingController with ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedHall;
  String? _selectedSlot;

  final List<String> halls = ["Main Hall", "Mini Hall"];
  final List<String> slots = ["Morning", "Afternoon", "Evening", "Custom"];

  DateTime? get selectedDate => _selectedDate;
  String? get selectedHall => _selectedHall;
  String? get selectedSlot => _selectedSlot;

  void setHall(String? hall) {
    _selectedHall = hall;
    notifyListeners();
  }

  void setSlot(String? slot) {
    _selectedSlot = slot;
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 360)),
    );

    if (date != null) {
      _selectedDate = date;
      dateController.text = DateFormat("dd MMM yyyy").format(_selectedDate!);
      notifyListeners();
    }
  }

  void submit() {
  }

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    phoneController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
