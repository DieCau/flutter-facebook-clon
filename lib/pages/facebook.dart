import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/circle_button.dart';
import '/widgets/publication_item.dart';
import '../widgets/what_is_on_your_mind.dart';
import '../widgets/quick_actions.dart';
import '../widgets/stories.dart';
import '/models/publication.dart';
import '/icons/custom_icons.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final publications = <Publication>[];
    final faker = Faker.instance;

    for (int i = 0; i < 50; i++) {
      // final random = faker.randomGenerator;
      const reactions = Reaction.values;
      final randomIndex = faker.datatype.number(min: 0, max: reactions.length - 1);

      final publication = Publication(
        user: User(
          avatar: faker.image.image(),
          username: faker.name.fullName(),
        ),
        title: faker.lorem.sentence(),
        createdAt: faker.date.past(DateTime.timestamp()),
        imageUrl: faker.image.image(width: 640, height: 480),
        commentsCount: faker.datatype.number(min: 0, max: 50000),
        sharesCount: faker.datatype.number(min: 0, max: 50000),
        currentUserReaction: reactions[randomIndex],
      );

      publications.add(publication);
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: SvgPicture.asset(
          'assets/logos/facebook.svg',
          colorFilter: const ColorFilter.mode(Color(0xff1C86E4), BlendMode.srcIn),
          width: 150,
        ),
        actions: const [
          CircleButton(
            color: Color(0xffBFBFBF),
            iconData: CustomIcons.search,
          ),
          SizedBox(
            width: 15,
          ),
          CircleButton(
            color: Color(0xffFE7574),
            iconData: CustomIcons.bell,
          ),
          SizedBox(
            width: 15,
          ),
          CircleButton(
            color: Color(0xff7BBAFF),
            iconData: CustomIcons.userFriends,
            showBadge: true,
          ),
          SizedBox(
            width: 15,
          ),
          CircleButton(
            color: Color(0xff1C86E4),
            iconData: CustomIcons.messenger,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const WhatIsOnYourMind(),
          const SizedBox(height: 30),
          const QuickActions(),
          const SizedBox(height: 30),
          const Stories(),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => PublicationItem(
              publication: publications[index],
            ),
            itemCount: publications.length,
          )
        ],
      ),
    );
  }
}
