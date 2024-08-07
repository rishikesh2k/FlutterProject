import 'package:flutter/material.dart';
import 'package:my_app/Screens/Auth_Screens/check_internet_connection.dart';
import 'package:my_app/Screens/Auth_Screens/local_auth.dart';
import 'package:my_app/Utils/constant_text.dart';
import 'package:my_app/Utils/font_text_style.dart';
import 'package:my_app/Utils/form_field_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(54),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.8),
                offset: const Offset(-5, -5),
                blurRadius: 4,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(5, 5),
                blurRadius: 4,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(12)),
            child: AppBar(
              backgroundColor: Colors.black,
              title: Center(
                  child: Text(
                "Sign In to Continue",
                style: FontTextStyle.appBarTitleTextStyle,
              )),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      offset: const Offset(-5, -5),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      offset: const Offset(5, 5),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: const Icon(
                  Icons.verified_user_outlined,
                  size: 100,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 100),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      offset: const Offset(5, -5),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      offset: const Offset(8, 8),
                      blurRadius: 8,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: FormFieldStyle.defaultSignInTextFieldStyle,
                        keyboardType: TextInputType.emailAddress,
                        style: FontTextStyle.hintTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration:
                            FormFieldStyle.defaultPasswordTextFieldStyle,
                        obscureText: true,
                        style: FontTextStyle.hintTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckInternetConnection(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        offset: const Offset(-5, -5),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(5, 5),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      ConstantText.signIn,
                      style: FontTextStyle.signInTextStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocalAuth(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        offset: const Offset(-5, -5),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(5, 5),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("assets/images/google.png"),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ConstantText.googleSignIn,
                          style: FontTextStyle.signInTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
