import 'package:daily_tasks5/models/task_mode.dart';
import 'package:daily_tasks5/models/user_model.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/firebase_function.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/opperation_for_task.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OpperationalForUser {
  static void addUser(UserModel userModel) {
    var collection = FirebaseCollection.creatUser();
    var docRef = collection.doc();

    docRef.set(userModel);
  }

  static Future<void> createUserWithEmailAndPassword(String email, String password,Function onSucces,Function onError) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user?.uid!=null){
        onSucces();
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
      if(credential.user?.uid!=null){
        onSucces();
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
}
