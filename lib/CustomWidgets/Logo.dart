import 'package:flutter/cupertino.dart' show Hero, Image, Widget;
import 'package:flutter/material.dart'
    show CircleAvatar, Colors, Hero, Image, Widget;

class Logo {
  Widget logoOnly() {
    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/Logo/InfinityLogoNoBackground.png'),
      ),
    );
  }
}
