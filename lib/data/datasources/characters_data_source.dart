import 'dart:convert';

import 'package:rick_e_morty/core/erros/exception.dart';
import 'package:http/http.dart' as http;

import '../../core/device/network_info.dart';
import '../../core/utils/endpoints.dart';
import '../models/response_model.dart';

abstract class ICharactersDataSource {
  Future<ResponseModel> charactersList();
  Future<ResponseModel> nextPage(String url);
  Future<ResponseModel> prevPage(String url);
}

class CharactersDataSource implements ICharactersDataSource {
  final client = http.Client();
  final allCharacters = Uri.parse((Endpoints.url + Endpoints.allChar));
  final INetworkInfo networkInfo;

  CharactersDataSource(this.networkInfo);

  @override
  Future<ResponseModel> charactersList() async {
    if (await networkInfo.isConnected) {
      final response = await client.get(allCharacters);
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);

          return ResponseModel.fromJson(responseJson);
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<ResponseModel> nextPage(String url) async {
    if (await networkInfo.isConnected) {
      final response = await client.get(Uri.parse(url));
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);

          return ResponseModel.fromJson(responseJson);
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<ResponseModel> prevPage(String url) async {
    if (await networkInfo.isConnected) {
      final response = await client.get(Uri.parse(url));
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);

          return ResponseModel.fromJson(responseJson);
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
