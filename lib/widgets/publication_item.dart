import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

import '/widgets/avatar.dart';
import '/models/publication.dart';

class PublicationItem extends StatelessWidget {
  String _getEmojiPath(Reaction reaction) {
    switch (reaction) {
      case Reaction.like:
        return 'assets/emojis/like.svg';
      case Reaction.love:
        return 'assets/emojis/heart.svg';
      case Reaction.laughing:
        return 'assets/emojis/laughing.svg';
      case Reaction.sad:
        return 'assets/emojis/sad.svg';
      case Reaction.shocking:
        return 'assets/emojis/shocked.svg';
      case Reaction.angry:
        return 'assets/emojis/angry.svg';
    }
  }

  const PublicationItem({
    super.key,
    required this.publication,
  });

  final Publication publication;

  String _formatCount(int value) {
    if (value <= 1000) {
      return value.toString();
    } else {
      return (value / 1000).toStringAsFixed(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    );
    const reactions = Reaction.values;
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 6,
            color: Color(0xffebebeb),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Avatar(
                  size: 35,
                  asset: publication.user.avatar,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(publication.user.username),
                const Spacer(),
                Text(
                  timeago.format(publication.createdAt),
                )
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: publication.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: padding.copyWith(top: 15),
            child: Text(
              publication.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactions.length,
                      (index) {
                        final reaction = reactions[index];
                        final isActive = reaction == publication.currentUserReaction;
                        return Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                _getEmojiPath(reaction),
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Icon(
                                Icons.circle,
                                color: isActive ? Colors.redAccent : Colors.transparent,
                                size: 5,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text('${_formatCount(publication.commentsCount)}k comentarios'),
                          const SizedBox(width: 15),
                          Text('${_formatCount(publication.sharesCount)}k compartidos'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
