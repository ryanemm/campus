import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

/*User ? _userFromFirebaseUser(User? user) {
   return (user != null) ? User(uid: user.uid) : null;
 }*/

  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password
      );
      User? user = result.user;
      return user?.uid;
      //return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }

  }

  Future signUpWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password
      );
      User? user = result.user;
      return user?.uid;
      //return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }

  }
  Future resetPass(String email) async {
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future signOut() async {
    try{
      return _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}
