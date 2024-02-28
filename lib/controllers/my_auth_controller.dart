import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nba/view/dashboard/dashboard_screen.dart';

import '../helper/toast_message.dart';
import '../models/my_user_model.dart';

class MyAuthController extends GetxController {


  final _auth = true.obs;
  final _loading = false.obs;
  bool get auth => _auth.value;
  bool get loading => _loading.value;
  set setAuth(bool v) => _auth.value = v;
  MyUserModel? currentUser;
  RxInt start = 30.obs;
  RxBool resendPassTimer = false.obs;

  Future<String?> createUser(MyUserModel userModel) async {
    currentUser = null;
    try {
      _loading.value = true;
      // String? profilePicUrl;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!)
          .then((value) async {
        userModel.userId = value.user!.uid;
        await Future.wait([
          FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid)
              .set(userModel.toMap())
              .then((value) => currentUser = userModel),
        ]);
      });
      _navigateToDashboard();
      return null;
    } on FirebaseAuthException catch (e) {
      _loading.value = false;
      return e.code;
    } catch (e) {
      _loading.value = false;
      return 'Error: ${e.toString()}';
    }
  }



  Future<String?> loginUser({required String email, required String password}) async {
    try {
      _loading.value = true;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email, password: password)
          .then((loginValue) async => await loadInitialData());
      return null;
    } on FirebaseAuthException catch (e) {
      _loading.value = false;
      return e.code;
    } catch (e) {
      _loading.value = false;
      return 'Error: ${e.toString()}';
    }
  }

  Future<void> userLogout(navigation)async{
    await FirebaseAuth.instance.signOut().then((value) => navigation);
  }

  ///If User Logged In
  Future<String?> loadInitialData() async {
    currentUser = null;
    try {
      _loading.value = true;
      await Future.wait([
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get()
            .then((userValue) =>
        currentUser = MyUserModel.fromMap(userValue.data()!)),
      ]);

      print(currentUser!.userId.toString());
      _navigateToDashboard();
      return null;
    } on FirebaseAuthException catch (e) {
      _loading.value = false;
      return e.code;
    } catch (e) {
      _loading.value = false;
      return 'Error: ${e.toString()}';
    }
  }

  void _navigateToDashboard() {
    try {
      Get.offAll(MyDashboardScreen(
          currentUser: currentUser!));
    } catch (e) {
      log(e.toString());
    }
  }

  sendPasswordResetEmail({required String email,required String toastMessage}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email)
          .then((value) {
        log("email send");
        ToastMessage.showToastMessage(toastMessage);
      }  );
    } catch (e) {
      ToastMessage.showToastMessage(e.toString());
      log("error in send password reset email: $e");
    }
  }


// Future<String> _uploadLogo(Uint8List data) async {
//   try {
//     Reference ref = FirebaseStorage.instance
//         .ref()
//         .child('logos')
//         .child(const Uuid().v4());
//     await ref.putData(data, SettableMetadata(contentType: 'image/png'));
//     String url = await ref.getDownloadURL();
//     return url;
//   } on FirebaseException catch (e) {
//     return e.code;
//   } catch (e) {
//     return 'Error: ${e.toString()}';
//   }
// }
}