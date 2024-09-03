# Flutter Movie App

This Flutter application is designed to demonstrate proficiency in Clean Architecture, SOLID principles, Dependency Injection, Bloc State Management, and Responsive Design.

## Project Structure

The project is organized into several core components to ensure maintainability and scalability, following Clean Architecture principles.

### Directory Structure
'''
📦lib
 ┣ 📂core
 ┃ ┣ 📂error
 ┃ ┃ ┣ 📜exceptions.dart
 ┃ ┃ ┗ 📜failure.dart
 ┃ ┣ 📂network
 ┃ ┃ ┣ 📜api_constance.dart
 ┃ ┃ ┗ 📜error_message_model.dart
 ┃ ┣ 📂services
 ┃ ┃ ┣ 📜di.dart
 ┃ ┃ ┣ 📜injection.config.dart
 ┃ ┃ ┗ 📜injection.dart
 ┃ ┣ 📂themes
 ┃ ┃ ┣ 📜dark_theme.dart
 ┃ ┃ ┗ 📜light_theme.dart
 ┃ ┣ 📂usecase
 ┃ ┃ ┗ 📜base_use_case.dart
 ┃ ┗ 📂utilis
 ┃ ┃ ┗ 📜enums.dart
 ┣ 📂movies
 ┃ ┣ 📂data
 ┃ ┃ ┣ 📂datasource
 ┃ ┃ ┃ ┣ 📜movie_remote_data_source.dart
 ┃ ┃ ┃ ┗ 📜movie_remote_data_source.g.dart
 ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┣ 📜movie.dart
 ┃ ┃ ┃ ┗ 📜movie.g.dart
 ┃ ┃ ┗ 📂repository
 ┃ ┃ ┃ ┗ 📜movies_reository.dart
 ┃ ┣ 📂domian
 ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┗ 📜base_movie_repository.dart
 ┃ ┃ ┗ 📂usecase
 ┃ ┃ ┃ ┣ 📜get_pupulare_movies.dart
 ┃ ┃ ┃ ┗ 📜search_on_movie.dart
 ┃ ┗ 📂presentation
 ┃ ┃ ┣ 📂component
 ┃ ┃ ┃ ┗ 📜populare_component.dart
 ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┗ 📂movies_bloc
 ┃ ┃ ┃ ┃ ┣ 📜movies_bloc.dart
 ┃ ┃ ┃ ┃ ┣ 📜movies_event.dart
 ┃ ┃ ┃ ┃ ┗ 📜movies_state.dart
 ┃ ┃ ┗ 📂screens
 ┃ ┃ ┃ ┣ 📜movie_detail_screen.dart
 ┃ ┃ ┃ ┣ 📜movies_screen.dart
 ┃ ┃ ┃ ┗ 📜search_screen.dart
 ┣ 📜main.dart
 ┗ 📜splash_screen.dart
'''

### Core Modules

- **Core**: Contains shared modules and utilities that are used across the application.
  - **Error**: Handles custom exceptions and failure models (`exceptions.dart`, `failure.dart`).
  - **Network**: Manages API-related constants and error handling models (`api_constance.dart`, `error_message_model.dart`).
  - **Services**: Implements Dependency Injection using `get_it` and `injectable` (`di.dart`, `injection.dart`).
  - **Themes**: Defines the application's dark and light themes (`dark_theme.dart`, `light_theme.dart`).
  - **Usecase**: Defines the base use case model to be implemented in various features (`base_use_case.dart`).
  - **Utils**: Contains utility files, such as enums (`enums.dart`).

### Feature Modules

- **Movies**: Contains all modules related to movie features.
  - **Data**: Handles data operations, including data sources, models, and repositories.
    - **Datasource**: Interfaces with remote APIs to fetch movie data (`movie_remote_data_source.dart`).
    - **Model**: Defines the data models used in the application (`movie.dart`).
    - **Repository**: Implements the repository pattern for data management (`movies_repository.dart`).
  - **Domain**: Defines business logic and use cases for the movies module.
    - **Repository**: Provides abstract definitions of repositories (`base_movie_repository.dart`).
    - **Usecase**: Contains use cases for different operations, such as fetching popular movies and searching movies (`get_populare_movies.dart`, `search_on_movie.dart`).
  - **Presentation**: Manages UI components and state management.
    - **Component**: UI components, such as movie cards or list items (`populare_component.dart`).
    - **Controller**: Manages state using Bloc pattern (`movies_bloc.dart`, `movies_event.dart`, `movies_state.dart`).
    - **Screens**: Defines the screens of the app, such as movie list, details, and search screens (`movies_screen.dart`, `movie_detail_screen.dart`, `search_screen.dart`).

### Main Application Entry Points

- **main.dart**: The main entry point of the application.
- **splash_screen.dart**: Initial screen displayed when the app is launched.

## State Management

The application uses **Bloc** for state management. Bloc (Business Logic Component) helps separate business logic from the UI layer, providing a predictable state management solution.

- **Bloc Pattern**: The Bloc pattern is implemented in the `movies_bloc` folder, including:
  - `movies_bloc.dart`: Manages the business logic for the movie features.
  - `movies_event.dart`: Defines various events related to movies that trigger changes in the state.
  - `movies_state.dart`: Represents the different states that the UI can be in, based on the movie data and user interactions.

## How to Run the Application

1. **Clone the repository** to your local machine.
2. **Navigate** to the project directory.
3. Run `flutter pub get` to install the necessary dependencies.
4. Obtain a free API key from [TMDb API](https://developer.themoviedb.org/docs/getting-started) and replace `YOUR_API_KEY` in the API-related files.
5. Run the app using `flutter run`.

## Additional Information

- **Dependency Injection**: Implemented using `get_it` and `injectable` to manage dependencies and ensure loose coupling.
- **State Management**: The application uses the Bloc pattern (`flutter_bloc`) for effective state management.
- **Networking**: Utilizes `dio` and `retrofit` for API calls and data fetching.
- **Responsive Design**: Ensures the application is responsive and provides a good user experience on various screen sizes.

## Evaluation Criteria

The application will be evaluated based on:

- Code quality and adherence to **Clean Architecture** and **SOLID principles**.
- Correct implementation of **Dependency Injection**.
- Quality and responsiveness of the **UI**.
- Effective use of **Bloc** for state management.
- Proper handling of **animations**.
- Overall functionality and user experience.

