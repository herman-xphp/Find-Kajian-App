class Validator {
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return 'Kolom ini tidak boleh kosong';
    }
    return null;
  }

  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value == null) {
      return 'Kolom ini harus diisi';
    }

    if (value is String || value == null) {
      if (value.toString() == 'null') return 'Kolom ini harus diisi';
      if (value.isEmpty) return 'Kolom ini harus diisi';
    }

    if (value is List) {
      if (value.isEmpty) return 'Kolom ini harus diisi';
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return 'Email tidak boleh kosong';

    final isValidEmail = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(value);

    if (!isValidEmail) {
      return 'Alamat email tidak valid';
    }
    return null;
  }

  static String? number(String? value) {
    if (value!.isEmpty) return 'Nomor tidak boleh kosong';

    final isNumber = RegExp(r'^[0-9]+$').hasMatch(value);
    if (!isNumber) {
      return 'Masukkan nomor yang valid';
    }
    return null;
  }

  static String? atLeastOneitem(List<Map<String, dynamic>> items) {
    final checkedItems = items.where((i) => i['checked'] == true).toList();
    if (checkedItems.isEmpty) {
      return 'Silakan pilih setidaknya satu item';
    }
    return null;
  }
}
