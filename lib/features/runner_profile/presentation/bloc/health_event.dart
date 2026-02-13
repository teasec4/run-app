import 'package:equatable/equatable.dart';

abstract class HealthEvent extends Equatable {
  const HealthEvent();

  @override
  List<Object?> get props => [];
}

class InitHealthEvent extends HealthEvent {
  const InitHealthEvent();
}

class FetchHealthDataTodayEvent extends HealthEvent {
  const FetchHealthDataTodayEvent();
}

class SyncHealthDataEvent extends HealthEvent {
  const SyncHealthDataEvent();
}

class RequestHealthAuthorizationEvent extends HealthEvent {
  const RequestHealthAuthorizationEvent();
}
