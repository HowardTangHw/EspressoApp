import 'package:dio/dio.dart';
import 'package:espresso/util/constants.dart' as constants;
import 'package:espresso/util/util.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: constants.apiBaseUrl,
    ));

    // 添加拦截器
    // dio.interceptors.add(
    //   TalkerDioLogger(
    //     settings: const TalkerDioLoggerSettings(
    //       printRequestHeaders: true,
    //       printResponseHeaders: true,
    //       printResponseMessage: true,
    //     ),
    //   ),
    // );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      // 处理Dio错误，例如网络错误等
      logger.e('Get请求错误: $e');
      rethrow;
    }
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? queryParameters, data}) async {
    try {
      Response response =
          await dio.post(path, queryParameters: queryParameters, data: data);
      return response;
    } on DioException catch (e) {
      // 处理Dio错误，例如网络错误等
      logger.e('Post请求错误: $e');
      rethrow;
    }
  }
}
