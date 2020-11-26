import 'package:dio/dio.dart';
import 'package:tritek_lms/data/entity/subscription.plans.dart';
import 'package:tritek_lms/http/endpoints.dart';

class SubscriptionPlanResponse {
  final List<SubscriptionPlans> results;
  final String error;

  SubscriptionPlanResponse(this.results, this.error);

  SubscriptionPlanResponse.fromJson(json)
      : results = (json as List)
            .map((i) => new SubscriptionPlans.fromJson(i))
            .toList(),
        error = "";

  SubscriptionPlanResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}

class SubscriptionPlanApiProvider {
  final Dio _dio = Dio();

  Future<SubscriptionPlanResponse> getSubscriptionPlans() async {
    try {
      Response response = await _dio.get(subsEndpoint);
      return SubscriptionPlanResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      // @todo
      print("Exception occurred: $error stackTrace: $stacktrace");
      return SubscriptionPlanResponse.withError("$error");
    }
  }
}
