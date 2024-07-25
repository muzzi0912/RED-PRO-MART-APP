import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var phone = ''.obs;
  var isUsernameValid = false.obs;
  var isEmailValid = false.obs;
  var isPhoneValid = false.obs;
  var obscurePassword = true.obs;
  var imageFile = Rx<XFile?>(null);

  void validateUsername(String value) {
    if (value.length >= 3) {
      isUsernameValid.value = true;
    } else {
      isUsernameValid.value = false;
    }
  }

  void validateEmail(String value) {
    // Add email validation logic here
    isEmailValid.value = true; // Set to true if valid
  }

  void validatePhone(String value) {
    // Add phone validation logic here
    isPhoneValid.value = true; // Set to true if valid
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile.value = pickedFile;
    }
  }
}
