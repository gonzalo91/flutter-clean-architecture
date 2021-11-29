abstract class Service<Type, Param>{

  Future<Type> call(Param params);

}

class NoParams{
  
}
