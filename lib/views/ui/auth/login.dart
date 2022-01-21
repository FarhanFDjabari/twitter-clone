import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twettir/views/app.dart';

import '../../../app_color.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: twitWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: twitBlue,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary: twitLightGrey,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegisterPage(),
              )),
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: twitBlue,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              color: twitBlue,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Log in to Twitter.",
                  style: TextStyle(
                      color: twitBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(isObscure ? Icons.lock : Icons.lock_open),
                      )),
                  obscureText: isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: twitGrey, fontSize: 14),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0,
                        onPrimary: twitBlue,
                      ),
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => App()),
                          (route) => false),
                      child: Text(
                        "Log in",
                        style: TextStyle(color: twitWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
