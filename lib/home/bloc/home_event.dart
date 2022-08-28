part of 'home_bloc.dart';

@immutable

/// This is the base class for home event
abstract class HomeEvent extends Equatable {}

/// This is the event class for input change
class InputChangedEvent extends HomeEvent {
  /// Constructor for InputChangedEvent
  InputChangedEvent({
    required this.input,
  });

  /// Input entered by user
  final String input;

  @override
  List<Object?> get props => [input];
}

/// This is the event class for submit button pressed
class SubmitButtonPressedEvent extends HomeEvent {
  /// Constructor for SubmitButtonPressedEvent
  SubmitButtonPressedEvent();

  @override
  List<Object?> get props => [];
}
