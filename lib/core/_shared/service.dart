abstract class Service<Type, Param> {
  Future<Type> call(Param params);
}

class GeneralReturnTypeService<T> {
  final bool error;
  final String errorMessage;
  final T? value;

  GeneralReturnTypeService(this.error, this.errorMessage, this.value);

  GeneralReturnTypeService.noValue(this.error, this.errorMessage)
      : value = null;
}

class NoParams {}
