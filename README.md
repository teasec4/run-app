# Running App

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.10+-00B4AB?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![iOS](https://img.shields.io/badge/iOS-14+-000?logo=apple)
![Android](https://img.shields.io/badge/Android-7.0+-3DDC84?logo=android)

A Flutter app for tracking running with runner profile, statistics, and dark theme support.

## Features

✨ **Localization**
- Support for English and Chinese languages
- Language switching in settings with single toggle
- Language preference saved in SharedPreferences

🌙 **Themes**
- Light and dark themes
- Automatic switching via toggle
- Theme preference persisted

📊 **Runner Profile**
- Level and experience visualization
- Steps and calories statistics
- Pixel-art character display

🗺️ **Main Screens**
- Home: Profile with progress bars
- Map: Map screen (placeholder)
- Settings: Language and theme controls

## Installation

```bash
# Clone repository
git clone https://github.com/teasec4/run-app.git
cd running_app

# Get dependencies
flutter pub get

# Run on emulator
flutter run
```

## Dependencies

- **flutter_bloc**: State management
- **flutter_localizations**: Localization support
- **shared_preferences**: Settings persistence
- **equatable**: Object comparison

## Project Structure

```
lib/
├── core/
│   ├── localization/      # Language BLoC
│   └── theme/             # Theme BLoC & themes
├── presentation/
│   ├── screens/           # Main screens
│   └── widgets/           # Reusable widgets
└── features/
    └── runner_profile/    # Runner profile feature
```

## Getting Started

```bash
flutter pub get
flutter run
```

## Author

[@teasec4](https://github.com/teasec4)
