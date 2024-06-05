import 'package:flutter/material.dart';
import '../icons/custom_icons.dart';
import 'circle_button.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          _QuickButton(
            colorCircle: Color(0xff92BE87),
            iconData: CustomIcons.photos,
            label: 'Galeria',
            colorContainer: Color(0xffECF8E9),
            colorText: Color(0xff9AC895),
          ),
          SizedBox(width: 15,),
          _QuickButton(
            colorCircle: Color(0xff85b8f9),
            iconData: CustomIcons.userFriends,
            label: 'Tag Amigos',
            colorContainer: Color(0xffe7f1fb),
            colorText: Color(0xff8399b0),
          ),
          SizedBox(width: 15,),
          _QuickButton(
            colorCircle: Color(0xfff5a695),
            iconData: CustomIcons.videoCamera,
            label: 'Vivo',
            colorContainer: Color(0xfffde9e8),
            colorText: Color(0xff9AC895),
          ),
        ],
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  const _QuickButton({
    required this.iconData,
    required this.label,
    required this.colorCircle,
    required this.colorContainer,
    required this.colorText,
  });

  final Color colorCircle;
  final Color colorContainer;
  final Color colorText;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 25,
      ),
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleButton(
            color: colorCircle,
            iconData: iconData,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            label,
            style: TextStyle(color: colorText),
          )
        ],
      ),
    );
  }
}
