import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lohe_lohe/app_color.dart';

class Compose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: twitWhite,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {},
              color: twitBlue,
              child: Text(
                "Tweet",
                style: TextStyle(color: twitWhite),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 0,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: twitGrey,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What\'s happening?',
                              hintStyle: TextStyle(fontSize: 18)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.globeAsia,
                        color: twitBlue,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Everyone can reply",
                        style: TextStyle(color: twitBlue),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.image_outlined),
                color: twitBlue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.gif_outlined),
                color: twitBlue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.poll_outlined),
                color: twitBlue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.pin_drop_outlined),
                color: twitBlue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
