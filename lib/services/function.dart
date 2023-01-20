String? emailvalidator(String value) {
  bool email = value.contains('@');
  bool point = value.contains('.');
  if (value.isEmpty) return 'Email requerido';
  if (value.length < 4 || !email || !point) return 'Email no valido';
//  if (!email||!point) return S.of(context).invalidmail;
  //if (!point) return S.of(context).invalidmail;
  return null;
}

String? passvalidator(String value) {
  bool point = value.contains('.');
  if (value.isEmpty) return 'Contraseña requerida';
  if (value.length < 4) return 'Contraseña muy corta';
//  if (!email||!point) return S.of(context).invalidmail;
  //if (!point) return S.of(context).invalidmail;
  return null;
}
