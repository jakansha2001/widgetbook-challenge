part of 'home_bloc.dart';

/// This is the status of home page
enum HomeStatus {
  /// Initial status
  initial,

  ///Loading Status
  loading,

  ///Loaded status
  loaded,

  ///Error status
  error,
}

/// This is the state class for home page
class HomeState extends Equatable {
  /// The unnamed constructor for homestate.
  const HomeState({
    this.status,
    this.input,
    this.output,
  });

  ///Initial state of home
  factory HomeState.initial() {
    return const HomeState(
      status: HomeStatus.initial,
      input: '',
      output: '',
    );
  }

  ///status for home
  final HomeStatus? status;

  ///Input entered by user
  final String? input;

  /// Output from API
  final String? output;

  /// Copy with method for home state
  HomeState copyWith({
    HomeStatus? status,
    String? input,
    String? output,
  }) {
    return HomeState(
      status: status ?? this.status,
      input: input ?? this.input,
      output: output ?? this.output,
    );
  }

  @override
  List<Object?> get props => [
        status,
        input,
        output,
      ];
}
