# Flutter-Riverbed-State-Management

A new Flutter project built with Riverpod for state management, using `flutter_dotenv` for managing environment variables securely, and `http` for fetching data from an external API. This application fetches stock price data using the Alpha Vantage API as an example of using global state with Riverpod.

## Features

- **Riverpod** for managing both global and local state.
- **`flutter_dotenv`** to securely store and load environment variables, like API keys.
- **`http`** for making network requests to fetch stock prices.
- **Material Design** UI for a simple user interface.

## Used Packages

The following packages are used in this project:

- **`flutter_riverpod`**: A state management library for Flutter that provides an efficient and flexible way to manage both global and local states.
  - Version: `^2.6.1`
  - Documentation: [Riverpod Documentation](https://riverpod.dev/)
  - Role: Manages both the **local state** (like the stock symbol) and **global state** (like the stock price).
  
- **`flutter_dotenv`**: A package for loading environment variables from a `.env` file.
  - Version: `^5.2.1`
  - Documentation: [flutter_dotenv Documentation](https://pub.dev/packages/flutter_dotenv)
  - Role: Loads the API key securely from a `.env` file to interact with external APIs without exposing sensitive data.

- **`http`**: A package for making HTTP requests in Flutter.
  - Version: `^1.2.2`
  - Documentation: [http Documentation](https://pub.dev/packages/http)
  - Role: Used for fetching data from the Alpha Vantage API to retrieve stock prices based on a symbol entered by the user.

- **`cupertino_icons`**: A Flutter package for Cupertino-style icons.
  - Version: `^1.0.8`
  - Documentation: [cupertino_icons Documentation](https://pub.dev/packages/cupertino_icons)
  - Role: Provides iOS-style icons for the app (used in the search bar).

- **`flutter_lints`**: Provides linting rules for Flutter projects to encourage best practices and maintain clean code.
  - Version: `^5.0.0`
  - Documentation: [flutter_lints Documentation](https://pub.dev/packages/flutter_lints)
  - Role: Helps maintain clean and consistent code across the project.

## Getting Started

Flutter-Riverbed-State-Management/
├── lib/
│   ├── main.dart            # Entry point for the app
│   ├── stock_price_screen.dart  # Screen that displays stock price
│   └── stock_api_client.dart   # API client to interact with the Alpha Vantage API
├── .env                      # File for storing sensitive environment variables
├── pubspec.yaml              # Project dependencies
└── README.md                 # This file


### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (SDK version 3.6.0 or higher)
- [Dart](https://dart.dev/get-dart) (SDK version 3.6.0 or higher)
- A text editor or IDE with Flutter support (e.g., [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)).

### Setup Instructions

1. **Clone the repository**:

   Open your terminal and run:

   ```bash
   git clone https://github.com/yourusername/Flutter-Riverbed-State-Management.git
   cd Flutter-Riverbed-State-Management
