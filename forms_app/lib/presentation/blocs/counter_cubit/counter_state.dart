part of 'counter_cubit.dart';

// Cubit it's another state manager like provider  from flutter bloc
class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
  });

  copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object> get props => [ counter, transactionCount ];

}
