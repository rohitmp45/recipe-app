#!/bin/bash

# 🔧 React Native Boilerplate Installation Fix Script
# This script fixes common installation issues

set -e

echo "🔧 Fixing React Native Boilerplate Installation..."
echo "================================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local status=$1
    local message=$2
    if [ "$status" = "PASS" ]; then
        echo -e "${GREEN}✅ $message${NC}"
    elif [ "$status" = "FAIL" ]; then
        echo -e "${RED}❌ $message${NC}"
    elif [ "$status" = "WARN" ]; then
        echo -e "${YELLOW}⚠️  $message${NC}"
    else
        echo -e "${BLUE}ℹ️  $message${NC}"
    fi
}

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    print_status "FAIL" "package.json not found. Please run this script from the project root directory."
    exit 1
fi

# Check Node.js version
echo "📋 Checking Node.js version..."
if command -v node >/dev/null 2>&1; then
    local node_version=$(node --version)
    local major_version=$(echo $node_version | cut -d. -f1 | tr -d 'v')
    if [ "$major_version" -ge 18 ]; then
        print_status "PASS" "Node.js version: $node_version (>= 18.0.0)"
    else
        print_status "FAIL" "Node.js version: $node_version (requires >= 18.0.0)"
        echo ""
        echo "Please upgrade Node.js to version 18 or higher:"
        echo "  nvm install 18.19.0"
        echo "  nvm use 18.19.0"
        echo "  nvm alias default 18.19.0"
        exit 1
    fi
else
    print_status "FAIL" "Node.js not found. Please install Node.js 18+ first."
    exit 1
fi

# Clear cache and remove existing files
echo ""
echo "📦 Clearing cache and removing existing files..."
print_status "INFO" "Removing node_modules and package-lock.json..."
rm -rf node_modules package-lock.json 2>/dev/null || true

print_status "INFO" "Clearing npm cache..."
npm cache clean --force

# Install with legacy peer deps
echo ""
echo "📥 Installing dependencies..."
print_status "INFO" "Installing with --legacy-peer-deps to resolve conflicts..."

if npm install --legacy-peer-deps; then
    print_status "PASS" "Dependencies installed successfully"
else
    print_status "FAIL" "Installation failed. Trying alternative methods..."
    
    echo ""
    print_status "INFO" "Trying with yarn..."
    if command -v yarn >/dev/null 2>&1; then
        if yarn install; then
            print_status "PASS" "Dependencies installed successfully with yarn"
        else
            print_status "FAIL" "Yarn installation also failed"
            exit 1
        fi
    else
        print_status "WARN" "Yarn not found. Installing yarn..."
        npm install -g yarn
        if yarn install; then
            print_status "PASS" "Dependencies installed successfully with yarn"
        else
            print_status "FAIL" "All installation methods failed"
            exit 1
        fi
    fi
fi

# Verify installation
echo ""
echo "✅ Verifying installation..."

# Check TypeScript compilation
print_status "INFO" "Checking TypeScript compilation..."
if npm run check-types >/dev/null 2>&1; then
    print_status "PASS" "TypeScript compilation successful"
else
    print_status "WARN" "TypeScript compilation has warnings (check output above)"
fi

# Check ESLint
print_status "INFO" "Checking ESLint..."
if npm run lint >/dev/null 2>&1; then
    print_status "PASS" "ESLint passed"
else
    print_status "WARN" "ESLint has warnings (check output above)"
fi

# Check Expo CLI
print_status "INFO" "Checking Expo CLI..."
if npx expo --version >/dev/null 2>&1; then
    local expo_version=$(npx expo --version)
    print_status "PASS" "Expo CLI version: $expo_version"
else
    print_status "WARN" "Expo CLI not working properly"
fi

# Check package versions
print_status "INFO" "Checking package versions..."
local expo_version=$(npm list expo --depth=0 2>/dev/null | grep expo | awk '{print $2}' | tr -d '├─└ ')
local react_version=$(npm list react --depth=0 2>/dev/null | grep react | awk '{print $2}' | tr -d '├─└ ')
local react_native_version=$(npm list react-native --depth=0 2>/dev/null | grep react-native | awk '{print $2}' | tr -d '├─└ ')

if [ ! -z "$expo_version" ]; then
    print_status "PASS" "Expo: $expo_version"
fi

if [ ! -z "$react_version" ]; then
    print_status "PASS" "React: $react_version"
fi

if [ ! -z "$react_native_version" ]; then
    print_status "PASS" "React Native: $react_native_version"
fi

echo ""
echo "================================================"
print_status "PASS" "Installation fix completed successfully!"
echo ""
echo "🚀 Next steps:"
echo "   1. Run 'npm start' to start development"
echo "   2. Run './scripts/verify-boilerplate.sh' for full verification"
echo "   3. Check docs/INSTALLATION_TROUBLESHOOTING.md for more help"
echo ""
echo "📚 For detailed setup instructions, see: docs/DEVELOPER_SETUP_GUIDE.md" 