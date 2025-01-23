part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}
class CounterEventIncrement extends CounterEvent {}
class CounterEventDecrement extends CounterEvent {}
class CounterEventReset extends CounterEvent{}
class CounterDivisibleByFive extends CounterEvent{}
