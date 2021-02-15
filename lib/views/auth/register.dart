import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_color.dart';

class RegisterPage extends StatelessWidget {
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create your account",
                  style: TextStyle(
                      color: twitBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0,
                        color: twitBlue,
                        child: Text(
                          "Create account",
                          style: TextStyle(color: twitWhite),
                        ),
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
