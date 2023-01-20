import 'package:image_picker/image_picker.dart';

Future<XFile> pickImage(ImageSource source) async {
  final ImagePicker _picker = ImagePicker();
  final XFile? pickedFile = await _picker.pickImage(source: source);
  return pickedFile!;
}
