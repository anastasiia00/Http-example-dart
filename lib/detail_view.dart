import 'package:flutter/material.dart';

import 'package:project/models/user_model.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.element,
  }) : super(key: key);
  final UserModel element;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 60,
              foregroundImage: element.avatar != null
                  ? NetworkImage(element.avatar)
                  : NetworkImage(
                      'https://media.istockphoto.com/illustrations/blank-man-profile-head-icon-placeholder-illustration-id1298261537?k=20&m=1298261537&s=612x612&w=0&h=8plXnK6Ur3LGqG9s-Xt2ZZfKk6bI0IbzDZrNH9tr9Ok='),
            ),
            SizedBox(
              width: 32,
              height: 32,
            ),
            element.firstName != null || element.lastName != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        element.firstName + element.lastName,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                : element.firstName != null
                    ? Text(
                        element.firstName,
                        style: TextStyle(fontSize: 20),
                      )
                    : element.lastName != null
                        ? Text(
                            element.lastName,
                            style: TextStyle(fontSize: 20),
                          )
                        : SizedBox(),
            Text(
              element.email,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
