import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      Get.snackbar('Profile Picture', 'Sucessfully uploaded!!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  //registering the user
  //upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    TaskSnapshot snap = await ref.putFile(image);
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl; 
  }

  void registerUser(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save out user to our auth and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );   

        await fireStore.collection('users').doc(cred.user!.uid).set(user.toJson());
        // .doc(cred.user!.uid)
        // .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'please enter all the fields!',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
      } else {
        Get.snackbar('Incorrect Email or Password!!',
            'Please enter correct email and password');
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }
}
