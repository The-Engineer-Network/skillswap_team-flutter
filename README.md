# SkillSwap 🔄

A peer-to-peer skill exchange platform where users can teach what they know and learn what they need. Built with Flutter for iOS and Android.

## 📱 About

SkillSwap connects people who want to exchange skills without monetary transactions. Users earn credits by teaching and spend credits to learn. Whether you're good at Excel, Figma, cooking, or music - there's someone who wants to learn from you!

**Tagline:** *"Teach what you know. Learn what you need."*

## ✨ Features

### Current Features (MVP)
- 📝 **User Authentication** - Sign up and login
- 👤 **User Profiles** - Showcase your skills and interests
- 🔍 **Skill Discovery** - Browse and search available skills
- 💳 **Credit System** - Earn credits by teaching, spend to learn
- 💬 **In-app Messaging** - Connect with skill partners
- 📅 **Session Scheduling** - Book learning sessions
- ⭐ **Ratings & Reviews** - Build trust through feedback

### Coming Soon
- 🎥 Video sessions
- 🏆 Skill badges and certifications
- 👥 Group sessions
- 📊 Learning analytics

## 🛠 Tech Stack

- **Framework:** Flutter 3.0+
- **State Management:** Provider
- **Navigation:** go_router
- **Backend:** [To be implemented]
- **Database:** [To be implemented]
- **Authentication:** [To be implemented]

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio or VS Code
- iOS Simulator (Mac only) or Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/skillswap.git
   cd skillswap
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add assets**
    - Download Inter font from [Google Fonts](https://fonts.google.com/specimen/Inter)
    - Place font files in `assets/fonts/`
    - Add your images to `assets/images/`

4. **Run the app**
   ```bash
   # For debug mode
   flutter run
   
   # Choose your device:
   # 1 - iOS Simulator
   # 2 - Android Emulator
   # 3 - Physical device (if connected)
   ```

## 📁 Project Structure

```
skillswap/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── core/                     # Core functionality
│   │   ├── constants/            # Colors, strings, styles
│   │   ├── routes/              # Navigation setup
│   │   └── utils/               # Helpers, validators, formatters
│   ├── models/                  # Data models
│   ├── providers/               # State management
│   ├── screens/                 # All app screens
│   │   ├── auth/               # Login, signup
│   │   ├── explore/            # Home/browse screen
│   │   ├── profile/            # User profile
│   │   ├── sessions/           # Learning sessions
│   │   └── wallet/             # Credits management
│   └── widgets/                 # Reusable components
│       ├── buttons/            # Custom buttons
│       ├── inputs/             # Text fields
│       └── common/             # Shared widgets
├── assets/
│   ├── fonts/                  # Inter font files
│   ├── images/                 # PNG/JPG images
│   └── icons/                  # App icons
└── pubspec.yaml                # Dependencies
```

## 🎨 Design System

### Colors
- **Primary:** Purple 
- **Secondary:** Light Purple
- **Background:** White/Dark gray
- **Text:** Dark gray/White

### Typography
- **Font:** Inter
- **Weights:** 300 (Light), 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold)

### Components
- Custom buttons with loading states
- Text fields with validation
- Custom app bar with credits display
- Card components with shadows

## 📱 Screens

1. **Onboarding** - First launch introduction
2. **Authentication** - Login/Signup
3. **Explore** - Browse and discover skills
4. **Sessions** - Manage learning sessions
5. **Wallet** - View credits and transactions
6. **Profile** - User profile and settings
7. **Skill Details** - Detailed skill information
8. **Live Session** - Active learning session

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Quick Start for Contributors
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---




