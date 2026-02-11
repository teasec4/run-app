# Requirements

## Functional Requirements

### 1. Localization (i18n)
- [ ] Support for at least 2 languages (EN, ZH)
- [ ] Language switching in settings
- [ ] Language preference saved between sessions
- [ ] All text strings loaded from JSON files

### 2. Theming
- [ ] Light theme as default
- [ ] Dark theme with Material Design 3 support
- [ ] Theme switching in settings
- [ ] Theme preference saved between sessions

### 3. Runner Profile
- [ ] Display level and experience
- [ ] Experience progress bar
- [ ] Steps statistics
- [ ] Calories statistics
- [ ] Pixel-art character visualization

### 4. Navigation
- [ ] Bottom Navigation Bar with 3 screens
- [ ] Home: Runner profile
- [ ] Map: Map screen
- [ ] Settings: Language and theme

### 5. Settings
- [ ] Language toggle (EN ↔ ZH)
- [ ] Theme toggle (Light ↔ Dark)
- [ ] Clean UI with SwitchListTile

## Non-Functional Requirements

### Performance
- [ ] Language loading in < 300ms
- [ ] Theme switching instant
- [ ] Widget optimization (const, BlocBuilder)

### UI/UX
- [ ] Full Dark Mode support
- [ ] High contrast for readability
- [ ] Responsive design

### Code Quality
- [ ] BLoC pattern for state management
- [ ] Equatable for proper comparisons
- [ ] Layered architecture (core, presentation, features)

## Supported Platforms
- ✅ iOS 14+
- ✅ Android 7+
- ✅ macOS
- ⚠️ Web (not priority)
