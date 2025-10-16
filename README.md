# React Native Boilerplate with Expo SDK 52

🚀 **Modern React Native boilerplate with Expo SDK 52, TypeScript, NativeWind, and best practices** ⚡️

## ✨ Features

### Core Technologies
- ⚡ [Expo SDK 52](https://expo.dev) - We are using EXPO SDK 52 as expo 53 is not full compaitable 
- ⚛️ [React Native 0.76](https://reactnative.dev) - Latest stable React Native version
- 🔥 [TypeScript 5.3](https://www.typescriptlang.org) - Full type safety and modern TypeScript features
- 🎨 [NativeWind 2.0](https://www.nativewind.dev) - Tailwind CSS for React Native
- 📱 [Expo Router v4](https://expo.github.io/router) - File-based routing with typed routes

### Developer Experience
- 🔍 [ESLint 8.55](https://eslint.org) - Code quality and consistency
- 🎨 [Prettier 3.1](https://prettier.io) - Automatic code formatting
- 🧪 [Jest 29.7](https://jestjs.io) & [React Testing Library](https://testing-library.com) - Comprehensive testing
- 🔗 [Husky](https://typicode.github.io/husky) - Git hooks for quality assurance
- 📦 [lint-staged](https://github.com/okonet/lint-staged) - Run linters on staged files

### Modern Features
- 🌙 **Dark Mode Support** - Automatic theme switching
- 📱 **Cross-Platform** - iOS, Android, and Web support
- ⚡ **Fast Refresh** - Instant updates during development
- 🔧 **Hot Reload** - Real-time code changes


## 🚀 Quick Start

### Prerequisites
- **Node.js**: 18.0.0 or higher (LTS recommended)
- **npm**: 8.0.0 or higher
- **Git**: Latest version

### Installation
```bash
# Clone the boilerplate
git clone <your-repo-url>
cd react-native-boilerplate

# Install dependencies
npm install

# Start development
npm start
```

### Platform-Specific Commands
```bash
# iOS (macOS only)
npm run dev:ios

# Android
npm run dev:android

# Web
npm run web
```

## ✅ Verification

Run the verification script to ensure everything is working:

```bash
./scripts/verify-boilerplate.sh
```

**Expected Results:**
- ✅ TypeScript compilation successful
- ✅ ESLint passed
- ✅ Prettier formatting successful
- ✅ Expo CLI working
- ✅ All packages compatible

## 📦 Available Scripts

| Script | Description |
|--------|-------------|
| `npm start` | Start Expo development server |
| `npm run dev:ios` | Run on iOS simulator |
| `npm run dev:android` | Run on Android emulator |
| `npm run web` | Run on web browser |
| `npm run check-types` | TypeScript type checking |
| `npm run lint` | ESLint code quality check |
| `npm run format` | Prettier code formatting |
| `npm run format:full` | Full formatting with ESLint |
| `npm test` | Run Jest tests |
| `npm run clean` | Clean build artifacts |

## 🏗️ Project Structure

```
react-native-boilerplate/
├── app/                    # Expo Router pages
│   ├── _layout.tsx        # Root layout
│   └── index.tsx          # Home page
├── src/
│   ├── templates/         # Reusable components
│   └── types/            # TypeScript types
├── assets/               # Images, fonts, etc.
├── docs/                # Documentation
├── scripts/             # Setup and utility scripts
└── e2e/                # End-to-end tests
```

## 🎨 Styling with NativeWind

```tsx
import { View, Text } from 'react-native';

export function Welcome() {
  return (
    <View className="flex-1 items-center justify-center bg-white dark:bg-gray-900">
      <Text className="text-3xl font-bold text-gray-900 dark:text-white">
        Hello World
      </Text>
    </View>
  );
}
```

## 📱 Platform Support

- ✅ **iOS** - Full support with latest features
- ✅ **Android** - Full support with latest features
- ✅ **Web** - Cross-platform web support
- ✅ **Development** - Hot reload, debugging, etc.

## 🔧 Configuration

### TypeScript
- **Strict mode** enabled
- **Path aliases** configured (`@/` for `src/`)
- **Modern ES2022** features

### ESLint
- **Airbnb** style guide
- **TypeScript** support
- **React Native** specific rules
- **Prettier** integration

### Prettier
- **Consistent formatting** across the project
- **Git hooks** integration
- **Editor integration** ready

## 🚀 Development Workflow

### Code Quality
```bash
# Check code quality
npm run lint

# Format code
npm run format

# Type checking
npm run check-types
```

### Git Workflow & Commit Checks

#### 🔍 **Current Status: Pre-commit Hooks DISABLED**
Your boilerplate currently has **pre-commit hooks disabled** to allow direct commits.

#### ✅ **Direct Commits (Current Setup)**
```bash
git add .
git commit -m "Your commit message"
# ✅ Commits immediately without any checks
```

#### 🔧 **Manual Quality Checks (When Needed)**
```bash
# Run checks manually when you want to verify code quality
npm run lint          # ESLint code quality check
npm run check-types   # TypeScript type checking
npm run format        # Prettier code formatting
npm run format:full   # Full formatting with ESLint
```

#### 🛡️ **To Re-enable Pre-commit Hooks**
If you want to bring back automated quality gates:

```bash
# Re-enable pre-commit hooks
mv .husky/pre-commit.disabled .husky/pre-commit
git add .husky/pre-commit
git commit -m "Re-enable pre-commit hooks"
```

**With hooks enabled, commits will automatically run:**
- ✅ **ESLint** - Code quality and style checks
- ✅ **TypeScript** - Type safety verification
- ✅ **Prettier** - Automatic code formatting
- ❌ **Commit blocked** if any checks fail

#### 🚫 **To Disable Pre-commit Hooks Again**
```bash
# Disable pre-commit hooks
mv .husky/pre-commit .husky/pre-commit.disabled
git add .husky/pre-commit.disabled
git commit -m "Disable pre-commit hooks"
```

#### 🎯 **Recommended Workflow**
- **For quick development**: Use direct commits (current setup)
- **Before important changes**: Run manual checks
- **For production code**: Re-enable pre-commit hooks
- **For team projects**: Keep hooks enabled for consistency

## 📚 Documentation

- 📖 [Developer Setup Guide](docs/DEVELOPER_SETUP_GUIDE.md) - Complete setup instructions

## 🎯 Best Practices

### Code Quality
- ✅ **TypeScript** for type safety
- ✅ **ESLint** for code quality
- ✅ **Prettier** for consistent formatting
- ✅ **Git hooks** for automated checks

### Performance
- ✅ **Expo SDK 52** optimizations
- ✅ **React Native 0.76** improvements
- ✅ **NativeWind** for efficient styling
- ✅ **Fast refresh** for development

### Security
- ✅ **Latest LTS** versions
- ✅ **Security patches** applied
- ✅ **Dependency scanning** ready
- ✅ **Production hardened** configuration

## 🔍 Troubleshooting

### Common Issues
1. **Node.js version**: Ensure you're using Node.js 18+
2. **Dependencies**: Run `npm install` if packages are missing
3. **Cache issues**: Clear npm cache with `npm cache clean --force`
4. **TypeScript errors**: Run `npm run check-types` for details

 

 

 