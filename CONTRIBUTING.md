# Contributing to SkillSwap 🤝

Welcome to the SkillSwap team! This guide will help you contribute to our project effectively. Remember, we're all learning together!

## 🌟 Our Team Values

1. **Learning First** - It's okay to not know everything
2. **Ask Questions** - No question is too small
3. **Help Each Other** - Share what you learn
4. **Clean Code** - Write code others can understand
5. **Test Everything** - Make sure it works before pushing

## 🚀 Getting Started

### First Time Setup

1. **Fork the repository**
    - Click the "Fork" button on GitHub
    - This creates your own copy

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR-USERNAME/skillswap.git
   cd skillswap
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/ORIGINAL-OWNER/skillswap.git
   ```

4. **Install dependencies**
   ```bash
   flutter pub get
   ```

## 📋 Before You Start Coding

### Daily Routine

1. **Pull latest changes**
   ```bash
   git checkout main
   git pull upstream main
   ```

2. **Create a new branch**
   ```bash
   git checkout -b feature/your-feature-name
   # Examples:
   # git checkout -b feature/add-search-bar
   # git checkout -b fix/login-button-color
   # git checkout -b update/readme-file
   ```

3. **Check assigned tasks**
    - Check Discord
    - Ask team lead if unsure

## 💻 Coding Standards

### 1. File Naming
```dart
// ✅ Good
login_screen.dart
user_model.dart
custom_button.dart

// ❌ Bad
LoginScreen.dart
usermodel.dart
CustomBtn.dart
```

### 2. Code Style

#### Variables and Functions
```dart
// ✅ Good
String userName = 'John';
int userAge = 25;
bool isLoading = false;

void handleLogin() {
  // function code
}

// ❌ Bad
String UserName = 'John';
int userage = 25;
bool loading = false;

void HandleLogin() {
  // function code
}
```

#### Widgets
```dart
// ✅ Good - Separate widget methods
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          _buildContent(),
          _buildFooter(),
        ],
      ),
    );
  }
  
  Widget _buildHeader() {
    return Container(
      // header code
    );
  }
}

// ❌ Bad - Everything in one method
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 300 lines of nested widgets
        ],
      ),
    );
  }
}
```

### 3. Always Use Our Design System

```dart
// ✅ Good - Using app constants
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';


Container(
  color: AppColors.primaryPurple,
  padding: EdgeInsets.all(AppStyles.spacingM),
  child: Text(AppStrings.hello, style: AppStyles.bodyLarge),
)

// ❌ Bad - Hardcoding values
Container(
  color: Color(0xFF8B5CF6),  // Don't hardcode colors!
  padding: EdgeInsets.all(16),  // Use AppStyles.spacingM
  child: Text('Hello', style: TextStyle(fontSize: 16)),  // Use AppStyles
)
```

### 4. Comments and TODOs

```dart
// ✅ Good comments
// Calculate total credits after transaction
int calculateCredits(int current, int spent) {
  // TODO: Add validation for negative values
  return current - spent;
}

// This widget displays user's profile card
// Used in: HomeScreen, ProfileScreen
class ProfileCard extends StatelessWidget {
  // widget code
}

// ❌ Bad comments
// This is a function  <-- Obvious, not needed
int calculateCredits(int current, int spent) {
  return current - spent; // returns value  <-- Obvious
}
```

### 5. Dark Mode Support

```dart
// ✅ Always check for dark mode
Widget build(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  
  return Container(
    color: isDark ? AppColors.backgroundDark : AppColors.backgroundWhite,
  );
}
```

## 🧪 Testing Your Code

### Before Every Commit

1. **Run the app**
   ```bash
   flutter run
   ```
    - Test on both iOS and Android if possible
    - Test in both light and dark mode

2. **Check for errors**
   ```bash
   flutter analyze
   ```

3. **Format your code**
   ```bash
   flutter format lib/
   ```

4. **Run tests** (if any)
   ```bash
   flutter test
   ```

### Manual Testing Checklist

- [ ] Feature works as expected
- [ ] No crashes or errors
- [ ] Works in dark mode
- [ ] Works on different screen sizes
- [ ] Back button works properly
- [ ] Keyboard doesn't cover input fields
- [ ] Loading states show correctly
- [ ] Error messages are user-friendly

## 📤 Submitting Your Work

### 1. Commit Your Changes

```bash
# Check what you changed
git status

# Add your changes
git add .

# Commit with clear message
git commit -m "Add search functionality to explore screen"

# Examples of good commit messages:
# "Fix login button not working on iOS"
# "Add dark mode support to profile screen"
# "Update user model with new fields"
# "Remove unused imports from helpers.dart"
```

### 2. Push Your Branch

```bash
git push origin feature/your-feature-name
```

### 3. Create Pull Request

1. Go to GitHub
2. Click "Pull Requests" → "New Pull Request"
3. Select your branch
4. Fill in the template:

```markdown
## What does this PR do?
Brief description of changes

## Screenshots (if UI changes)
Add screenshots here

## Testing Done
- [ ] Tested on Android
- [ ] Tested on iOS
- [ ] Tested in dark mode
- [ ] Tested on tablet

## Related Issue
Closes #123 (if applicable)
```

## 📝 Pull Request Rules

1. **One feature per PR** - Don't mix different features
2. **Small PRs are better** - Easier to review
3. **Update from main** - Before creating PR
4. **Respond to feedback** - Make requested changes quickly
5. **Don't merge your own PR** - Wait for approval

## 🐛 Reporting Bugs

### How to Report

Create a GitHub issue with:
1. **Title**: Clear, specific description
2. **Description**: What went wrong?
3. **Steps to reproduce**: How to make it happen
4. **Expected behavior**: What should happen
5. **Screenshots**: If it's a UI issue
6. **Device info**: iPhone/Android, screen size

### Bug Report Template

```markdown
## Bug Description
The login button doesn't work when...

## Steps to Reproduce
1. Open the app
2. Go to login screen
3. Enter email and password
4. Tap login button

## Expected Behavior
Should navigate to home screen

## Actual Behavior
Nothing happens, stays on login screen

## Screenshots
[Add screenshots]

## Device
- Device: iPhone 12
- OS: iOS 15.0
- App Version: 1.0.0
```

## 💬 Communication

### Daily Standup Questions
1. What did you complete yesterday?
2. What will you work on today?
3. Any blockers or need help?

### When to Ask for Help
- Stuck for more than 30 minutes
- Before making major changes
- When you're not sure about the approach
- Found a bug you can't fix

### Where to Ask
- **Quick questions**: Team Slack/Discord
- **Code reviews**: GitHub PR comments
- **Bugs**: GitHub Issues
- **General discussion**: Team meetings

## 📚 Learning Resources

### Flutter Basics
- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter YouTube Channel](https://www.youtube.com/flutterdev)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)

### Dart Language
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [DartPad](https://dartpad.dev/) - Practice online

### Git Help
- [GitHub Guides](https://guides.github.com/)
- [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)

## ⚠️ Important Rules

### DO ✅
- Test your code before pushing
- Write clear commit messages
- Update documentation if needed
- Help teammates when they're stuck
- Ask questions when unsure
- Use the project's style guide
- Keep PRs small and focused

### DON'T ❌
- Push directly to main branch
- Commit sensitive information (passwords, API keys)
- Copy-paste code without understanding
- Ignore error messages
- Skip testing
- Make breaking changes without discussion
- Work on someone else's task without asking

## 🎯 Code Review Checklist

When reviewing others' code, check:

- [ ] Code follows our style guide
- [ ] No hardcoded values
- [ ] Uses app constants (colors, styles, spacing)
- [ ] Includes dark mode support
- [ ] Has proper error handling
- [ ] No unused imports or variables
- [ ] Clear variable and function names
- [ ] Comments for complex logic
- [ ] Works on both platforms

## 🆘 Getting Help

**Remember: Everyone is learning! Don't be afraid to:**
- Ask questions in the team chat
- Request a pair programming session
- Ask for a code review before submitting
- Admit when you don't understand something

## 🎉 Recognition

We celebrate:
- First PR merged 🎊
- Bug fixes 🐛
- Helping teammates 🤝
- Learning new skills 📚
- Clean code 🧹

---

**Welcome to the team! We're excited to build SkillSwap together!** 🚀