import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app_mobb/pages/home.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final googlesignin = GoogleSignIn();
  final firebaseauth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool islogedin = false;

  @override
  void initState() {
    super.initState();
    issignedin();
  }

  void issignedin() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    islogedin = await googlesignin.isSignedIn();
    if (islogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handlesignin() async {
    preferences = await SharedPreferences.getInstance();
    setState(() async {
      loading = true;
      GoogleSignInAccount? googleuser = await googlesignin.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleuser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final User firebaseuser =
          (await firebaseauth.signInWithCredential(credential)) as User;
      if (firebaseuser != null) {
        final QuerySnapshot result = (await FirebaseFirestore.instance
                .collection("users")
                .where("id", isEqualTo: firebaseuser.uid))
            as QuerySnapshot<Object?>;
        final List<DocumentSnapshot> documents =
            result as List<DocumentSnapshot<Object?>>;
        if (documents.length == 0) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(firebaseuser.uid)
              .set({
            "id": firebaseuser.uid,
            "username": firebaseuser.displayName,
            "profilepicture": firebaseuser.photoURL
          });
          await preferences.setString("id", firebaseuser.uid);
          await preferences.setString(
              "username", firebaseuser.displayName as String);
          await preferences.setString(
              "photoUrl", firebaseuser.photoURL as String);
          // FirebaseFirestore.instance.collection("users").add({
          //   "id": firebaseuser.uid,
          //   "username": firebaseuser.displayName,
          //   "profilepicture": firebaseuser.photoURL
          // });
        } else {
          await preferences.setString("id", documents[0]['id']);
          await preferences.setString("username", documents[0]['username']);
          await preferences.setString("photoUrl", documents[0]['photoUrl']);
        }
        Fluttertoast.showToast(msg: "Logged in");
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
