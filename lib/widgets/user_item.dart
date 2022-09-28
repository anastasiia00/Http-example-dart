import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    this.firstName,
    this.lastName,
    this.avatar,
    this.email,
  }) : super(key: key);

  final String? firstName;
  final String? lastName;
  final String? avatar;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                firstName != null || lastName != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              firstName!,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              lastName!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    : firstName != null
                        ? Text(
                            firstName!,
                            style: TextStyle(color: Colors.white),
                          )
                        : lastName != null
                            ? Text(
                                lastName!,
                                style: TextStyle(color: Colors.white),
                              )
                            : SizedBox(),
              ],
            ),
            avatar != null
                ? CircleAvatar(
                    foregroundImage: NetworkImage(avatar!),
                  )
                : CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://media.istockphoto.com/illustrations/blank-man-profile-head-icon-placeholder-illustration-id1298261537?k=20&m=1298261537&s=612x612&w=0&h=8plXnK6Ur3LGqG9s-Xt2ZZfKk6bI0IbzDZrNH9tr9Ok='),
                  )
          ],
        ),
      ),
    );
  }
}
