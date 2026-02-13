import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/health_kit_repository.dart';
import 'health_event.dart';
import 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  final HealthKitRepository _repository;

  HealthBloc(this._repository) : super(const HealthInitial()) {
    on<InitHealthEvent>(_onInit);
    on<FetchHealthDataTodayEvent>(_onFetchHealthDataToday);
    on<SyncHealthDataEvent>(_onSync);
    on<RequestHealthAuthorizationEvent>(_onRequestAuthorization);
  }

  Future<void> _onInit(InitHealthEvent event, Emitter<HealthState> emit) async {
    emit(const HealthLoading());
    try {
      final hasAccess = await _repository.hasHealthAccess();

      if (!hasAccess) {
        final authorized = await _repository.requestHealthAuthorization();
        if (!authorized) {
          emit(const HealthAuthorizationDenied());
          return;
        }
      }

      final data = await _repository.getHealthDataToday();
      emit(HealthLoaded(data));
    } catch (e) {
      emit(HealthError('Failed to initialize health data: ${e.toString()}'));
    }
  }

  Future<void> _onFetchHealthDataToday(
    FetchHealthDataTodayEvent event,
    Emitter<HealthState> emit,
  ) async {
    emit(const HealthLoading());
    try {
      final data = await _repository.getHealthDataToday();
      emit(HealthLoaded(data));
    } catch (e) {
      emit(HealthError('Failed to fetch health data: ${e.toString()}'));
    }
  }

  Future<void> _onSync(
    SyncHealthDataEvent event,
    Emitter<HealthState> emit,
  ) async {
    final currentState = state;
    
    try {
      final data = await _repository.getHealthDataToday();
      
      if (currentState is HealthLoaded) {
        emit(HealthSynced(data, message: 'Synced with Apple Health'));
        // После показа сообщения, перейдём в HealthLoaded
        Future.delayed(const Duration(milliseconds: 500), () {
          emit(HealthLoaded(data));
        });
      } else {
        emit(HealthLoaded(data));
      }
    } catch (e) {
      emit(HealthError('Failed to sync health data: ${e.toString()}'));
    }
  }

  Future<void> _onRequestAuthorization(
    RequestHealthAuthorizationEvent event,
    Emitter<HealthState> emit,
  ) async {
    try {
      final authorized = await _repository.requestHealthAuthorization();

      if (authorized) {
        final data = await _repository.getHealthDataToday();
        emit(HealthLoaded(data));
      } else {
        emit(const HealthAuthorizationDenied());
      }
    } catch (e) {
      emit(HealthError('Failed to request authorization: ${e.toString()}'));
    }
  }
}
