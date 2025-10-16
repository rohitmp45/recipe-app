# 🔧 Installation Troubleshooting Guide

This guide helps resolve common issues when setting up the React Native boilerplate.

## 🚨 Common Installation Issues

### Issue 1: ERESOLVE Peer Dependency Conflicts

**Error Message:**
```
npm error code ERESOLVE
npm error ERESOLVE could not resolve
npm error While resolving: react-test-renderer@19.0.0
npm error Found: react@18.3.1
npm error Could not resolve dependency:
npm error peer react@"^19.0.0" from react-test-renderer@19.0.0
```

**Cause:** Jest-expo is trying to install React 19 dependencies, but the boilerplate uses React 18.

**Solutions:**

#### Solution 1: Use Legacy Peer Dependencies (Recommended)
```bash
npm install --legacy-peer-deps
```

#### Solution 2: Clear Cache and Reinstall
```bash
# Clear npm cache
npm cache clean --force

# Remove existing node_modules and package-lock.json
rm -rf node_modules package-lock.json

# Reinstall with legacy peer deps
npm install --legacy-peer-deps
```

#### Solution 3: Use Yarn Instead
```bash
# Install yarn if not already installed
npm install -g yarn

# Install dependencies with yarn
yarn install
```

### Issue 2: Node.js Version Compatibility

**Error Message:**
```
npm WARN notsup Unsupported engine for react-native@0.76.3: wanted: {"node":">=18"}
```

**Solution:**
```bash
# Check your Node.js version
node --version

# If below 18, upgrade Node.js
# Using nvm (recommended):
nvm install 18.19.0
nvm use 18.19.0
nvm alias default 18.19.0

# Or download from nodejs.org
```

### Issue 3: Expo CLI Issues

**Error Message:**
```
Error: Cannot find module 'node:assert'
```

**Solution:**
```bash
# Install Expo CLI globally
npm install -g @expo/cli

# Or use npx
npx expo --version
```

### Issue 4: TypeScript Version Warnings

**Warning Message:**
```
WARNING: You are currently running a version of TypeScript which is not officially supported
```

**Solution:**
This is a warning, not an error. The boilerplate works fine with TypeScript 5.9.2. You can ignore this warning or downgrade TypeScript if needed:

```bash
npm install typescript@~5.8.3 --save-dev
```

## 🛠️ Step-by-Step Installation Guide

### Prerequisites Check
```bash
# Check Node.js version (should be 18+)
node --version

# Check npm version
npm --version

# Check if you have nvm (optional but recommended)
nvm --version
```

### Clean Installation Process
```bash
# 1. Clone the repository
git clone <your-repo-url>
cd react-native-boilerplate

# 2. Clear any existing installation
rm -rf node_modules package-lock.json

# 3. Install dependencies with legacy peer deps
npm install --legacy-peer-deps

# 4. Verify installation
npm run check-types
npm run lint
```

### Alternative Installation Methods

#### Using Yarn
```bash
# Install yarn globally
npm install -g yarn

# Install dependencies
yarn install

# Run verification
yarn check-types
yarn lint
```

#### Using pnpm
```bash
# Install pnpm globally
npm install -g pnpm

# Install dependencies
pnpm install

# Run verification
pnpm run check-types
pnpm run lint
```

## 🔍 Verification Commands

After installation, run these commands to verify everything is working:

```bash
# Check TypeScript compilation
npm run check-types

# Check code quality
npm run lint

# Check code formatting
npm run format

# Check Expo CLI
npx expo --version

# Check package versions
npm list expo expo-router react react-native --depth=0
```

**Expected Results:**
- ✅ TypeScript: No errors
- ✅ ESLint: No errors (may show TypeScript version warning - this is normal)
- ✅ Prettier: Files formatted
- ✅ Expo CLI: Version 0.24.20
- ✅ Packages: All compatible versions

## 🚀 Quick Fix Script

Create a `fix-installation.sh` script:

```bash
#!/bin/bash

echo "🔧 Fixing React Native Boilerplate Installation..."

# Clear cache and remove existing files
echo "📦 Clearing cache and removing existing files..."
rm -rf node_modules package-lock.json
npm cache clean --force

# Install with legacy peer deps
echo "📥 Installing dependencies..."
npm install --legacy-peer-deps

# Verify installation
echo "✅ Verifying installation..."
npm run check-types
npm run lint

echo "🎉 Installation complete!"
```

Make it executable and run:
```bash
chmod +x fix-installation.sh
./fix-installation.sh
```

## 📱 Platform-Specific Issues

### macOS Issues
```bash
# If you get permission errors
sudo npm install --legacy-peer-deps

# If you get Xcode issues
xcode-select --install
```

### Windows Issues
```bash
# Use PowerShell as Administrator
# Or use WSL (Windows Subsystem for Linux)
```

### Linux Issues
```bash
# Install build essentials
sudo apt-get update
sudo apt-get install build-essential

# Install dependencies
npm install --legacy-peer-deps
```

## 🆘 Still Having Issues?

### 1. Check Your Environment
```bash
# System information
node --version
npm --version
npx --version
git --version

# Check if you're behind a proxy
npm config list
```

### 2. Try Different Node.js Versions
```bash
# Using nvm
nvm install 18.19.0
nvm use 18.19.0
nvm install 20.11.0
nvm use 20.11.0
```

### 3. Contact Support
If you're still having issues:
1. Check the [GitHub Issues](https://github.com/your-repo/issues)
2. Create a new issue with:
   - Your operating system
   - Node.js version
   - npm version
   - Complete error message
   - Steps to reproduce

## 🎯 Success Indicators

Your installation is successful when:
- ✅ `npm install --legacy-peer-deps` completes without errors
- ✅ `npm run check-types` shows no errors
- ✅ `npm run lint` shows no errors
- ✅ `npx expo --version` shows version 0.24.20
- ✅ All npm scripts are available and working

---

*Last updated: August 5, 2024*
*For the latest updates, check the main README.md file* 