#!/bin/bash

# React Native Boilerplate Verification Script
echo "🔍 Verifying React Native Boilerplate..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ $2${NC}"
    else
        echo -e "${RED}❌ $2${NC}"
        exit 1
    fi
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Check Node.js version
echo "📋 Checking Node.js version..."
NODE_VERSION=$(node --version)
REQUIRED_VERSION="v18"

if [[ "$NODE_VERSION" == v18* ]] || [[ "$NODE_VERSION" == v19* ]] || [[ "$NODE_VERSION" == v20* ]] || [[ "$NODE_VERSION" == v21* ]]; then
    print_status 0 "Node.js version: $NODE_VERSION (✅ Compatible)"
else
    print_warning "Node.js version: $NODE_VERSION (⚠️  Requires v18+)"
    print_warning "Please upgrade Node.js: nvm install 18.19.0 && nvm use 18.19.0"
fi

# Check if node_modules exists
echo "📦 Checking dependencies..."
if [ -d "node_modules" ]; then
    print_status 0 "Dependencies installed"
else
    print_warning "Dependencies not installed. Run: npm install"
    exit 1
fi

# Check TypeScript
echo "🔧 Checking TypeScript..."
if command -v npx &> /dev/null; then
    npx tsc --version > /dev/null 2>&1
    print_status $? "TypeScript available"
else
    print_status 1 "npx not available"
fi

# Check ESLint
echo "🔍 Checking ESLint..."
if command -v npx &> /dev/null; then
    npx eslint --version > /dev/null 2>&1
    print_status $? "ESLint available"
else
    print_status 1 "npx not available"
fi

# Check Jest
echo "🧪 Checking Jest..."
if command -v npx &> /dev/null; then
    npx jest --version > /dev/null 2>&1
    print_status $? "Jest available"
else
    print_status 1 "npx not available"
fi

# Check Expo CLI
echo "📱 Checking Expo CLI..."
if command -v npx &> /dev/null; then
    npx expo --version > /dev/null 2>&1
    print_status $? "Expo CLI available"
else
    print_status 1 "npx not available"
fi

# Check TypeScript compilation
echo "🔧 Checking TypeScript compilation..."
if command -v npx &> /dev/null; then
    npx tsc --noEmit > /dev/null 2>&1
    print_status $? "TypeScript compilation successful"
else
    print_status 1 "npx not available"
fi

# Check ESLint
echo "🔍 Checking ESLint..."
if command -v npx &> /dev/null; then
    npx eslint . --ext .ts,.tsx --max-warnings 0 > /dev/null 2>&1
    print_status $? "ESLint passed"
else
    print_status 1 "npx not available"
fi

# Check if tests can run
echo "🧪 Checking tests..."
if command -v npx &> /dev/null; then
    timeout 30s npx jest --passWithNoTests > /dev/null 2>&1
    print_status $? "Tests can run"
else
    print_status 1 "npx not available"
fi

echo ""
echo "🎉 Verification complete!"
echo ""
echo "📋 Summary:"
echo "  - Node.js: $NODE_VERSION"
echo "  - Dependencies: $(if [ -d "node_modules" ]; then echo "Installed"; else echo "Missing"; fi)"
echo "  - TypeScript: $(if command -v npx &> /dev/null && npx tsc --version > /dev/null 2>&1; then echo "Available"; else echo "Not available"; fi)"
echo "  - ESLint: $(if command -v npx &> /dev/null && npx eslint --version > /dev/null 2>&1; then echo "Available"; else echo "Not available"; fi)"
echo "  - Jest: $(if command -v npx &> /dev/null && npx jest --version > /dev/null 2>&1; then echo "Available"; else echo "Not available"; fi)"
echo "  - Expo CLI: $(if command -v npx &> /dev/null && npx expo --version > /dev/null 2>&1; then echo "Available"; else echo "Not available"; fi)"
echo ""
echo "🚀 Next steps:"
echo "  - Run: npm start (to start development server)"
echo "  - Run: npm run dev:ios (for iOS simulator)"
echo "  - Run: npm run dev:android (for Android emulator)"
echo "  - Run: npm test (to run tests)" 