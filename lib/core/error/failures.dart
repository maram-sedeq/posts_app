import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{


  
}
class offLineFailure extends Failure{
  @override
  List<Object?> get props => throw [];
}

class ServerFailure extends Failure{
  @override
  List<Object?> get props => throw [];
}

class EmptyCachFailure extends Failure{
  @override
  List<Object?> get props => throw [];
}