import 'package:bloctest/constants/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://www.breakingbadapi.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 100,
      receiveTimeout: 20 * 100,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharecter() async {
    Response response = await dio.get('characters');
    print(response.data.toString());
    return response.data;
  }
}
