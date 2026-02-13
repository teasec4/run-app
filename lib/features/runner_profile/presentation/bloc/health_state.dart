import 'package:equatable/equatable.dart';
import '../../data/health_data_model.dart';

abstract class HealthState extends Equatable {
  const HealthState();

  @override
  List<Object?> get props => [];
}

class HealthInitial extends HealthState {
  const HealthInitial();
}

class HealthLoading extends HealthState {
  const HealthLoading();
}

class HealthLoaded extends HealthState {
  final HealthData data;

  const HealthLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class HealthError extends HealthState {
  final String message;

  const HealthError(this.message);

  @override
  List<Object?> get props => [message];
}

class HealthAuthorizationDenied extends HealthState {
  const HealthAuthorizationDenied();
}

class HealthSynced extends HealthState {
  final HealthData data;
  final String message;

  const HealthSynced(this.data, {this.message = 'Synced successfully'});

  @override
  List<Object?> get props => [data, message];
}
