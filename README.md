# Flutter Clean Architecture
#### _(kind of)_

This package is a skeleton for new apps based on Uncle Bob's clean architecture porposal and is strongly realted on [this implementation][RsRp] (which has its own course).
*Note: Don't forget creating .env file*

## Structure

### Config
Used for storing the project configuration, in this case we use an .env to store those variables and we set them here, so we don't use the .env directly.
For example, if we are going to use Firebase, we could create a _firebase_config.dart_ to store those variables

### Core
In this folder we store our business logic, as well as the interafaces needed.
We have a _shared and the features.

- _/\_shared_:
    Folder where we store all the shared components of BL.
    - _'\api'_   it is here where we make the abstraction of the external         packages we are going to use. Instead of strongly couple our BL to an     external implementation of a HTTP client, we create an interface that     should be implemented.
    - _/entities_:
        Entities shared across all the system.
    - _/errors_:
        Here, we store the errors we should catch and are aware of them.
    - _/repositories_:
        Repositories used at least in two services or features.
-   user_login
    -   *user_login_repository.dart*: Abstraction of the login repository
    -   *user_login_service.dart*: In the services we implement the BL needed. In other implementations, its called _Usecases_, but I wanted to keep this aproach.

### Infra
In this folder, we have more or less the same structure as core, this is it because we are implementing all those interfaces, both shared and features ones. One difference we have against core, is that inside every feature, we are creating the _data_ folder (Maybe it could a better aproach, but for this first version we are doing it this way). There we could fetch external data through some API.

### UI
- Pages
    The purpose of page folder is to have well organized the screen of the project. Inside of each page, we should have its corresponding _states_ (In this case we are using BLoC), _widgets_,  etc.
    In case we need to share several components through pages, we could create a shared folder as we did in _core_. It could be useful in, for example, using the same style in input fields, texts, etc. So we can homologate this common widgets.

- State
    Its main objective is to store al the main states we want to have at the top of hierarchy. We put a RootState which is the responsible to manage the authorization, validating token existance, verifying token in server, etc. You'd want to initialize them in the AppState widget.

- helpers.dart
    In this file we define all the ui functions to be used in different widgets, for example, triggering a success snackbar, so we can avoid the boilerplate of creating them from scratch.

### injection_container.dart
    Here you should initialize all your dependencies. (The package we used for DI is GetIt)
    
### main.dart
The main file where we initialize .env file, dependency injection, stablish MaterialApp and set AppState widget as the home page.



## Plugins

Plugins installed out of the box


| Plugin | README |
| ------ | ------ |
| http | [Dart Pub][Pk1] |
| get_it | [Dart Pub][Pk2] |
| flutter_dotenv | [Dart Pub][Pk3] |
| flutter_bloc |[Dart Pub][Pk4] |
| internet_connection_checker | [Dart Pub][Pk5] |
| flutter_secure_storage | [Dart Pub][Pk6] |
| hive | [Dart Pub][Pk7] |
| path_provider | [Dart Pub][Pk8] |


## Todo
    - Ui, core, infra folders in different local packages
    - Tests

## License

MIT


   [RsRp]: <https://github.com/ResoCoder/flutter-tdd-clean-architecture-course>
   [Pk1]: <https://pub.dev/packages/http>
   [Pk2]: <https://pub.dev/packages/get_it>
   [Pk3]: <https://pub.dev/packages/flutter_dotenv>
   [Pk4]: <https://pub.dev/packages/flutter_bloc>
   [Pk5]: <https://pub.dev/packages/internet_connection_checker>
   [Pk6]: <https://pub.dev/packages/flutter_secure_storage>
   [Pk7]: <https://pub.dev/packages/hive>
   [Pk8]: <https://pub.dev/packages/path_provider>
   
   
