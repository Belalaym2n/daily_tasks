
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks5/models/task_mode.dart';
import 'package:daily_tasks5/models/user_model.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/firebase_function.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/opperation_for_task.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OpperationalForUser {
  static Future<void> addUser(UserModel userModel) {
    var collection = FirebaseCollection.creatUser();
    var docRef = collection.doc(userModel.id);

   return docRef.set(userModel);
  }

  static Future<void> createUserWithEmailAndPassword(
      String email,
      String name,
      String age,

      String password,
      Function onSucces,Function onError) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user?.uid!=null){
        UserModel userModel =UserModel(name: name, age: age, email: email, id: credential.user!.uid);
        addUser(userModel).then((value) {
          credential.user!.sendEmailVerification();

          onSucces();
        });

      }
      print("object");
    } on FirebaseAuthException catch (e) {
      print('belal ${e.message}');
      onError(e.message);
      print(onError);
      if (e.code == 'weak-password') {
        //onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //   onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static signInWithEmailAndPassword(String email, String password,Function onSucces,Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      credential.user!.sendEmailVerification();
      if(credential.user?.uid!=null){
        var user=await readUser(credential.user!.uid);
        if(credential.user!.emailVerified){
          onSucces();
        }
        else{
          onError("please verify your mail");
        }






      }
    } on FirebaseAuthException catch (e) {
      onError(e.message);

      if (e.code == 'user-not-found') {
        onError(e.message);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError(e.message);

        print('Wrong password provided for that user.');
      }
    }
  }
 static Future<UserModel?> readUser(String id)async{
  DocumentSnapshot<UserModel> documentReference=await FirebaseCollection.creatUser().doc(id).get();
  return documentReference.data();
  }
}