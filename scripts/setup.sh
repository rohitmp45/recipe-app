#!/bin/bash

# React Native Boilerplate Setup Script
echo "🚀 Setting up React Native Boilerplate..."

# Check if nvm is installed
if ! command -v nvm &> /dev/null; then
    echo "❌ nvm is not installed. Please install nvm first:"
    echo "   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash"
    echo "   Then restart your terminal and run this script again."
    exit 1
fi

# Check current Node.js version
CURRENT_NODE_VERSION=$(node --version)
REQUIRED_NODE_VERSION="18.19.0"

echo "📋 Current Node.js version: $CURRENT_NODE_VERSION"
echo "📋 Required Node.js version: $REQUIRED_NODE_VERSION"

# Check if we need to upgrade Node.js
if [[ "$CURRENT_NODE_VERSION" != "v$REQUIRED_NODE_VERSION" ]]; then
    echo "🔄 Upgrading Node.js to version $REQUIRED_NODE_VERSION..."
    
    # Install the required Node.js version
    nvm install $REQUIRED_NODE_VERSION
    nvm use $REQUIRED_NODE_VERSION
    nvm alias default $REQUIRED_NODE_VERSION
    
    echo "✅ Node.js upgraded successfully!"
else
    echo "✅ Node.js version is already correct!"
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Install Expo CLI globally if not already installed
if ! command -v expo &> /dev/null; then
    echo "📱 Installing Expo CLI..."
    npm install -g @expo/cli
fi

# Setup Git hooks
echo "🦊 Setting up Git hooks..."
npm run prepare

echo "🎉 Setup complete! You can now start developing:"
echo "   npm start          # Start Expo development server"
echo "   npm run dev:ios    # Run on iOS simulator"
echo "   npm run dev:android # Run on Android emulator"
echo "   npm test           # Run tests" 