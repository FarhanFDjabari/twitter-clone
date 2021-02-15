import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lohe_lohe/views/app.dart';

import '../../app_color.dart';
import '../auth/register.dart';

class LoginPage extends StatelessWidget {
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
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegisterPage(),
              )),
              splashColor: twitLightGrey,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
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
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.lock),
                      )),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                Center(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {},
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: twitGrey, fontSize: 14),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => App()),
                          (route) => false),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                      color: twitBlue,
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
