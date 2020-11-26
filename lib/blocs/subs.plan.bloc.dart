import 'package:rxdart/rxdart.dart';
import 'package:tritek_lms/data/repository/subscription.plans.repository.dart';
import 'package:tritek_lms/http/subscription.plan.dart';

class SubsBloc {
  final SubscriptionPlanRepository _repository = SubscriptionPlanRepository();
  final BehaviorSubject<SubscriptionPlanResponse> _subSubject =
      BehaviorSubject<SubscriptionPlanResponse>();

  getSubs() async {
    SubscriptionPlanResponse response = await _repository.getSubs();
    _subSubject.sink.add(response);
  }

  dispose() {
    _subSubject.close();
  }

  BehaviorSubject<SubscriptionPlanResponse> get subject => _subSubject;
}

final subBloc = SubsBloc();
