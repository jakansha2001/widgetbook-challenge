import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

part 'home_event.dart';
part 'home_state.dart';

/// This is the bloc class for home page
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Constructor for HomeBloc
  HomeBloc({
    required WidgetbookApi widgetbookApi,
  })  : _widgetbookApi = widgetbookApi,
        super(HomeState.initial()) {
    on<InputChangedEvent>(_onInputChanged);
    on<SubmitButtonPressedEvent>(_onSubmitButtonPressed);
  }

  final WidgetbookApi _widgetbookApi;

  Future<void> _onInputChanged(
    InputChangedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(input: event.input));
  }

  Future<void> _onSubmitButtonPressed(
    SubmitButtonPressedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final output = await _widgetbookApi.welcomeToWidgetbook(
        message: state.input!,
      );
      emit(state.copyWith(status: HomeStatus.loaded, output: output));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
