import 'package:facebook_clon/icons/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: SvgPicture.asset(
          'assets/logos/facebook.svg', 
          color: Colors.blueAccent,
          width: 150,
        ),
        actions: [
          Container(child: const Icon(CustomIcons.search),)
        ],
      ),
    );
  }

}