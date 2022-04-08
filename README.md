# pcv4_mobile

Flutter frontend for pcv4maxpro.

## Getting Started with Flutter

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Architecture

This Flutter project is largely based on the [domain-driven design](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/#t-1649182526546)
guidelines from ResoCoder and is divided primarily into 4 layers:

- Presentation    - Flutter pages and widgets
- Application     - UI state and event logic
- Domain          - core abstractions of basic components
- Infrastructure  - external API calls and exception handling 

These layers live in their respective folders under [`lib/`](lib).

Each feature in the app can require code in multiple layers.
Note that the application and infrastructure layers should not talk to each other directly,
only through the domain layer.

Dependencies are automatically managed using [injectable](https://pub.dev/packages/injectable),
which uses code generation to automatically register services marked with `@injectable`.

## Running the Project

In order to run the project simply use

```shell
flutter run
```

or your IDE runner.

## Working on the Project

When working on a feature, first determine the layers that must be modified.
Generally, you would start with the domain layer and move into the outer layers.

This project relies heavily on several tools that work using code generation, namely:

- [freezed](https://pub.dev/packages/freezed)
- [injectable](https://pub.dev/packages/injectable)
- [auto_route](https://pub.dev/packages/auto_route)

When working with these packages, start code generation by running:

```shell
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Working in the Domain Layer

This layer uses `freezed` a lot,
so make sure to run the code generation command if edit things here.

If the feature requires additional abstractions such as interfaces, entities, or failures,
those would be placed in that feature's folder in the domain layer.

Simple examples of these can be seen here:

- Interface - [`IAuthFacade`](lib/domain/auth/i_auth_facade.dart)
- Entity - [`User`](lib/domain/auth/user.dart)
- Failure - [`AuthFailure`](lib/domain/auth/auth_failure.dart)

### Working in the Application Layer

This layer uses `freezed` and `injectable` a lot,
so make sure to run the code generation command if edit things here.

This layer describes the possible states and events of the UI. 

The general pattern for state is to have a `freezed` union for the UI state,
and in the case of forms a `freezed` data class for the form state.

Simple examples of these can be seen here:

- UI state - [`AuthState`](lib/application/auth/auth_state.dart)
- Form state - [`SignInFormState`](lib/application/auth/sign_in_form/sign_in_form_state.dart)

In order to change the state,
the UI must emit events which are also defined as a `freezed` union, such as:

- UI events - [`AuthEvent`](lib/application/auth/auth_event.dart)
- Form events - [`SignInFormEvent`](lib/application/auth/sign_in_form/sign_in_form_event.dart)

These events are then handled by the BLoC (Business Logic Component),
which changes the state as needed based on events it receives. See it in action here:

- UI Bloc - [`AuthBloc`](lib/application/auth/auth_bloc.dart)
- Form Bloc - [`SignInFormBloc`](lib/application/auth/sign_in_form/sign_in_form_bloc.dart)

### Working in the Presentation Layer

The presentation layer is made-up entirely of Flutter-specific code and widgets.
The directory layout is as follows:

- [pages](lib/presentation/app_widget.dart) - root Flutter widget, MaterialApp
- [pages](lib/presentation/pages) - Flutter code for pages and UI components
- [routes](lib/presentation/routes) - aggregate all the pages into URL-style paths

Each page the class name should end in `Page` (e.g. [SignIn**Page**](lib/presentation/pages/auth/sign_in/sign_in_page.dart)),
it should have its own directory, and can have a `widgets` subfolder for its components.

To make a page accessible, add a route for it in [app_router.dart](lib/presentation/routes/app_router.dart)
and run the code generation command.
This generates a corresponding class to the page, e.g. `SignInPageRoute` for `SignInPage` in [app_router.gr.dart](lib/presentation/routes/app_router.gr.dart)

### Working in the Infrastructure Layer

The infrastructure layer should implement interfaces defined in the domain layer, such as:

- implements [`IAuthFacade`](lib/domain/auth/i_auth_facade.dart) - [`Auth0AuthFacade`](lib/infrastructure/auth/auth0_auth_facade.dart)
