import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat/stream_chat.dart';

import '../constant/env.dart';
import '../util/index.dart';

class AvatarCircleCachedNetwork extends StatelessWidget {
  final String? photoUrl;
  final double? size;
  const AvatarCircleCachedNetwork({Key? key, this.photoUrl, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      CachedNetworkImage(
      errorWidget: (context, url, error) => CircleAvatar(
        radius: size ?? 20,
        backgroundImage: NetworkImage(DEFAULT_EMPTY_AVATAR_URL),
      ), imageUrl: photoUrl ?? DEFAULT_EMPTY_AVATAR_URL,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: size ?? 20,
          backgroundImage: imageProvider,
        );
      },
    );
  }
}
