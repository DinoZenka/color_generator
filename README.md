# Color Randomizer

A visually dynamic Flutter application that generates random background colors on tap, calculates accessible text colors for readability, and persists a history of generated colors.

## 🚀 Features

- **Tap to Randomize**: Tap anywhere on the screen to generate a new random background color.
- **Color Display**: Shows the hex code and RGB values of the current active color.
- **Color History**: View a history of previously generated colors.
- **Persistent Storage**: All generated colors are saved locally and persist across app restarts.
- **Accessibility**: Automatically calculates contrast colors (black/white) for text to ensure readability against any background.
- **Favorites**: Mark specific colors as favorites in your history.

## 🛠️ Technologies Used

- **Framework**: [Flutter](https://flutter.dev) (Dart)
- **State Management**: [Riverpod](https://riverpod.dev) (using `riverpod_generator` and `flutter_riverpod`)
- **Local Persistence**: [Shared Preferences](https://pub.dev/packages/shared_preferences) (`SharedPreferencesAsync`)
- **Data Modeling**:
  - [Equatable](https://pub.dev/packages/equatable) for value equality
  - [JSON Serializable](https://pub.dev/packages/json_serializable) for DTO mapping
  - [UUID](https://pub.dev/packages/uuid) for unique identification
- **Architecture**: Clean Architecture (Layered approach)

## 🏗️ Architecture

The project follows a **Clean Architecture** pattern to ensure separation of concerns, testability, and maintainability:

- **`core/`**: Shared utilities, extensions (e.g., color contrast calculations), and common constants.
- **`domain/`**: The core business logic layer. Contains:
  - **Entities**: Simple data objects (`ColorModel`).
  - **Repositories**: Abstract definitions for data operations.
- **`data/`**: Implementation of the domain layer. Contains:
  - **Data Sources**: Interaction with local storage (`SharedPreferences`).
  - **Repositories**: Implementation of domain repository interfaces.
  - **Models/DTOs**: Data Transfer Objects with JSON serialization logic.
- **`presentation/`**: The UI layer. Contains:
  - **Screens**: Main application views (`HomeScreen`).
  - **Widgets**: Reusable UI components.
  - **Providers**: Riverpod state management logic.

## 🏁 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (check `pubspec.yaml` for minimum version)
- Dart SDK

### Installation

1.  **Clone the repository**:

    ```bash
    git clone <repository-url>
    cd color_randomizer
    ```

2.  **Install dependencies**:

    ```bash
    flutter pub get
    ```

3.  **Run code generation**:
    This project uses `build_runner` for Riverpod and JSON serialization.

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the application**:
    ```bash
    flutter run
    ```

## 🧪 Testing

To run the project's tests (if any):

```bash
flutter test
```

---
