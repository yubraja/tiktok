import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';

class UploadVideoController extends GetxController{

  _


  _uploadVideoToStorage(String id, String videoPath){
    Reference ref= firebaseStorage.ref().child('videos').child(id);
  }

  uploadVideo(String name, String caption ,String videoPath) async{
    try{

      String uid=firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc=await fireStore.collection('users').doc(uid).get();

      var allDocs=await fireStore.collection('videos').get();
      int len=allDocs.docs.length;
      _uploadVideoToStorage('video $len',videoPath);


    
    }
    catch(e){

    }
  }
}