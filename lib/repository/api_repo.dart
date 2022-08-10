import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/utils/api_helper.dart';

class ApiRepo {
  // Login
  static Future<ApiResponse> login(
    String _email,
    String _password,
  ) async {
    try {
      const _url = "https://api-telly-tell.herokuapp.com/api/client/signin";

      final _resp = await http.post(
        Uri.parse(_url),
        body: json.encode(
          {
            "email": _email,
            "password": _password,
          },
        ),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "charset": "utf-8"
        },
      );

      final _data = json.decode(_resp.body);

      if (_resp.statusCode == 201) {
        return ApiResponse(success: Success(data: _data));
      } else {
        return ApiResponse(failure: Failure(message: _data['message']));
      }
    } catch (e) {
      return ApiResponse(failure: Failure(message: 'Something went wrong'));
    }
  }

  // signup
  static Future<ApiResponse> signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      const _url = 'https://api-telly-tell.herokuapp.com/api/client/signup';

      final _resp = await http.post(
        Uri.parse(_url),
        body: jsonEncode(
          {
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password,
          },
        ),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "charset": "utf-8"
        },
      );

      final _data = json.decode(_resp.body);

      if (_resp.statusCode == 201) {
        return ApiResponse(success: Success(data: _data));
      } else {
        return ApiResponse(failure: Failure(message: _data['message']));
      }
    } catch (e) {
      return ApiResponse(failure: Failure(message: 'Something went wrong'));
    }
  }

  static Future<ApiResponse> getMovieLists(String _token) async {
    try {
      const _url = 'https://api-telly-tell.herokuapp.com/movies/rahul.verma';

      final _resp = await http.get(
        Uri.parse(_url),
        headers: {
          "Authorization": "Bearer $_token",
          "Content-type": "application/json",
          "Accept": "application/json",
          "charset": "utf-8"
        },
      );

      final _data = json.decode(_resp.body);

      if (_resp.statusCode == 200) {
        return ApiResponse(success: Success(data: _data['data']));
      } else {
        return ApiResponse(failure: Failure(message: _data['message']));
      }
    } catch (e) {
      return ApiResponse(failure: Failure(message: 'Something went wrong'));
    }
  }
}
