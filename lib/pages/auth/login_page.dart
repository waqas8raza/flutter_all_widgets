import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_strip/widgets/app_text_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextField(
                hintText: 'Email',
                lableText: "Email",
                isObscure: false,
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                hintText: 'Password',
                lableText: "Password",
                isObscure: true,
                prefixIcon: Icons.password,
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                onPressed: () => signInWithGoogle(),
                label: const Text('Login'),
                icon: const Icon(Icons.login_outlined),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  signOut();
                },
                label: const Text('Logout'),
                icon: const Icon(Icons.logout_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
