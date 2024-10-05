
# Weather App

A simple Flutter application that fetches and displays weather data based on the user's current location using the WeatherAPI.com API.

## Features

- Fetches weather data using the user's current location.
- Displays current temperature and location.
- User-friendly interface with a responsive design.


## Prerequisites

- Flutter SDK installed (follow the instructions at [flutter.dev](https://flutter.dev/docs/get-started/install)).
- An API key from [Weatherapi](https://www.weatherapi.com/).


## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/keyur70/weatherapp.git
cd weatherapp
```

### 2. Add Your API Key
- Create a file named .env in the root of the project directory.
- Add your Weather API key to the .env file:
```bash
WEATHER_API_KEY = your_api_key_here
```
### 3. Install Dependencies
Run the following command to install the necessary packages:

```bash
flutter pub get
```

### 4. Run the Application
To run the application on a connected device or emulator, use the following command:

```bash
flutter run
```
### Usage
- Upon launching the app, the application will request permission to access the user's location.
- Once granted, it will fetch and display the current weather data on the screen.

### Note
- Make sure to check the .gitignore file to ensure your .env file is not tracked by version control.
- You can customize the UI further by modifying the weather_screen.dart file.

### Contributing
Feel free to submit issues or pull requests if you would like to contribute to the project!


