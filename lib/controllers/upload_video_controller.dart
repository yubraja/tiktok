import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';

class UploadVideoController extends GetxController{

  uploadVideo(String name, String caption ,String videoPath) async{
    try{

      String uid=firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc=await fireStore.collection('users').doc(uid).get();

      

    }
    catch(e){

    }
  }
}