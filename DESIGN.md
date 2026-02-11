# Design

## Architecture

```
Running App
├── Core Layer
│   ├── Localization (LocaleBloc, LocaleState, LocaleEvent)
│   └── Theme (ThemeBloc, ThemeState, ThemeEvent)
├── Presentation Layer
│   ├── Screens (HomeScreen, MapScreen, SettingsScreen)
│   └── Widgets (PixelRunner, PixelRunnerCharacter)
└── Features Layer
    └── RunnerProfile
```

## State Management

### LocaleBloc
```
InitLocaleEvent → Load saved language from SharedPreferences
ChangeLocaleEvent → Change language + save preference
```

### ThemeBloc
```
InitThemeEvent → Load saved theme from SharedPreferences
ChangeThemeEvent → Change theme + save preference
```

## Color Palette

### Light Theme
- Primary: `#FF8C00` (Orange)
- Background: `#FAF8F3` (Light Beige)
- Text: `#212121` (Dark Gray)

### Dark Theme
- Primary: `#FF8C00` (Orange)
- Background: `#1A1714` (Dark Brown)
- Text: `#FFFFFF` (White)

### Accents
- Level/XP: `#FF8C00` (Orange)
- Steps: `#5C6BC0` (Blue)
- Calories: `#E74C3C` (Red)

## Navigation Flow

```
SplashScreen (300ms)
    ↓
AppInitializer
    ↓
RunningApp (Bottom Navigation)
    ├── Home → RunnerProfileScreen
    ├── Map → MapScreen
    └── Settings → SettingsScreen
```

## Localization Structure

```json
{
  "settings": {
    "title": "Settings",
    "language": "Language",
    "dark_mode": "Dark Mode",
    "light_mode": "Light Mode",
    "theme": "Theme"
  },
  "navigation": {
    "home": "Home",
    "map": "Map",
    "settings": "Settings"
  },
  "stats": {
    "level": "LEVEL",
    "experience": "XP",
    "steps": "STEPS",
    "calories": "CALORIES"
  }
}
```

## Responsive Design

- **Supports**: Mobile (portrait/landscape)
- **Breakpoints**: Tablet support via `MediaQuery.of(context).size`
- **SafeArea**: For notched screens

## Key Decisions

1. **BLoC** over Provider - better scalability
2. **Equatable** - avoid unnecessary UI rebuilds
3. **SharedPreferences** - simple persistence
4. **JSON localization** - easy to add new languages
5. **Material Design 3** - modern, clean design
