import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data_model/cats_fact_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://catfact.ninja/")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET("/breeds?limit=60")
  Future<CatsFactModel> getTasks();
}
