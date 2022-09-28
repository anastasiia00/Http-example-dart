import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/models/user_model.dart';

class UserRepoitory {
  String endpoint = 'https://reqres.in/api/users?page2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((element) => UserModel.fromJson(element)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
