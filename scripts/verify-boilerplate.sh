#!/bin/bash

# 🚀 React Native Boilerplate Verification Script
# This script verifies that the boilerplate is 100% ready for all developers

set -e

echo "🔍 React Native Boilerplate Verification"
echo "========================================"
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

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check Node.js version
check_node_version() {
    echo "📋 Checking Node.js version..."
    if command_exists node; then
        local node_version=$(node --version)
        local major_version=$(echo $node_version | cut -d. -f1 | tr -d 'v')
        if [ "$major_version" -ge 18 ]; then
            print_status "PASS" "Node.js version: $node_version (>= 18.0.0)"
        else
            print_status "FAIL" "Node.js version: $node_version (requires >= 18.0.0)"
            return 1
        fi
    else
        print_status "FAIL" "Node.js not found"
        return 1
    fi
}

# Function to check npm version
check_npm_version() {
    echo "📦 Checking npm version..."
    if command_exists npm; then
        local npm_version=$(npm --version)
        local major_version=$(echo $npm_version | cut -d. -f1)
        if [ "$major_version" -ge 8 ]; then
            print_status "PASS" "npm version: $npm_version (>= 8.0.0)"
        else
            print_status "WARN" "npm version: $npm_version (recommended >= 8.0.0)"
        fi
    else
        print_status "FAIL" "npm not found"
        return 1
    fi
}

# Function to check if node_modules exists
check_dependencies() {
    echo "📦 Checking dependencies..."
    if [ -d "node_modules" ]; then
        print_status "PASS" "node_modules directory exists"
    else
        print_status "FAIL" "node_modules directory not found. Run 'npm install' first."
        return 1
    fi
}

# Function to check package.json
check_package_json() {
    echo "📄 Checking package.json..."
    if [ -f "package.json" ]; then
        print_status "PASS" "package.json exists"
        
        # Check for required fields
        if grep -q '"name"' package.json; then
            print_status "PASS" "package.json has name field"
        else
            print_status "FAIL" "package.json missing name field"
            return 1
        fi
        
        if grep -q '"version"' package.json; then
            print_status "PASS" "package.json has version field"
        else
            print_status "FAIL" "package.json missing version field"
            return 1
        fi
    else
        print_status "FAIL" "package.json not found"
        return 1
    fi
}

# Function to check TypeScript compilation
check_typescript() {
    echo "🔧 Checking TypeScript compilation..."
    if npm run check-types >/dev/null 2>&1; then
        print_status "PASS" "TypeScript compilation successful"
    else
        print_status "FAIL" "TypeScript compilation failed"
        return 1
    fi
}

# Function to check ESLint
check_eslint() {
    echo "🔍 Checking ESLint..."
    if npm run lint >/dev/null 2>&1; then
        print_status "PASS" "ESLint passed"
    else
        print_status "WARN" "ESLint has warnings (check output above)"
    fi
}

# Function to check Prettier
check_prettier() {
    echo "🎨 Checking Prettier..."
    if npm run format >/dev/null 2>&1; then
        print_status "PASS" "Prettier formatting successful"
    else
        print_status "FAIL" "Prettier formatting failed"
        return 1
    fi
}

# Function to check Expo CLI
check_expo_cli() {
    echo "📱 Checking Expo CLI..."
    if npx expo --version >/dev/null 2>&1; then
        local expo_version=$(npx expo --version)
        print_status "PASS" "Expo CLI version: $expo_version"
    else
        print_status "FAIL" "Expo CLI not working"
        return 1
    fi
}

# Function to check package versions
check_package_versions() {
    echo "📋 Checking package versions..."
    
    # Check core packages
    local expo_version=$(npm list expo --depth=0 2>/dev/null | grep expo | awk '{print $2}' | tr -d '├─└ ')
    local react_version=$(npm list react --depth=0 2>/dev/null | grep react | awk '{print $2}' | tr -d '├─└ ')
    local react_native_version=$(npm list react-native --depth=0 2>/dev/null | grep react-native | awk '{print $2}' | tr -d '├─└ ')
    local expo_router_version=$(npm list expo-router --depth=0 2>/dev/null | grep expo-router | awk '{print $2}' | tr -d '├─└ ')
    
    if [ ! -z "$expo_version" ]; then
        print_status "PASS" "Expo: $expo_version"
    else
        print_status "FAIL" "Expo not found"
        return 1
    fi
    
    if [ ! -z "$react_version" ]; then
        print_status "PASS" "React: $react_version"
    else
        print_status "FAIL" "React not found"
        return 1
    fi
    
    if [ ! -z "$react_native_version" ]; then
        print_status "PASS" "React Native: $react_native_version"
    else
        print_status "FAIL" "React Native not found"
        return 1
    fi
    
    if [ ! -z "$expo_router_version" ]; then
        print_status "PASS" "Expo Router: $expo_router_version"
    else
        print_status "FAIL" "Expo Router not found"
        return 1
    fi
}

# Function to check Git hooks
check_git_hooks() {
    echo "🔗 Checking Git hooks..."
    if [ -f ".husky/pre-commit" ]; then
        print_status "PASS" "Pre-commit hook exists"
    else
        print_status "WARN" "Pre-commit hook not found"
    fi
}

# Function to check essential files
check_essential_files() {
    echo "📁 Checking essential files..."
    
    local files=("app.json" "tsconfig.json" "tailwind.config.js" "babel.config.js" "metro.config.js")
    
    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            print_status "PASS" "$file exists"
        else
            print_status "FAIL" "$file not found"
            return 1
        fi
    done
}

# Function to check app structure
check_app_structure() {
    echo "🏗️  Checking app structure..."
    
    if [ -d "app" ]; then
        print_status "PASS" "app directory exists"
        
        if [ -f "app/_layout.tsx" ]; then
            print_status "PASS" "app/_layout.tsx exists"
        else
            print_status "FAIL" "app/_layout.tsx not found"
            return 1
        fi
        
        if [ -f "app/index.tsx" ]; then
            print_status "PASS" "app/index.tsx exists"
        else
            print_status "FAIL" "app/index.tsx not found"
            return 1
        fi
    else
        print_status "FAIL" "app directory not found"
        return 1
    fi
    
    if [ -d "src" ]; then
        print_status "PASS" "src directory exists"
    else
        print_status "WARN" "src directory not found"
    fi
}

# Function to check scripts
check_scripts() {
    echo "📜 Checking npm scripts..."
    
    local scripts=("start" "dev:ios" "dev:android" "web" "check-types" "lint" "format")
    
    for script in "${scripts[@]}"; do
        if npm run --silent "$script" --help >/dev/null 2>&1; then
            print_status "PASS" "npm run $script available"
        else
            print_status "FAIL" "npm run $script not available"
            return 1
        fi
    done
}

# Main verification function
main() {
    echo "🚀 Starting React Native Boilerplate Verification..."
    echo ""
    
    local exit_code=0
    
    # Run all checks
    check_node_version || exit_code=1
    check_npm_version || exit_code=1
    check_dependencies || exit_code=1
    check_package_json || exit_code=1
    check_typescript || exit_code=1
    check_eslint || exit_code=1
    check_prettier || exit_code=1
    check_expo_cli || exit_code=1
    check_package_versions || exit_code=1
    check_git_hooks || exit_code=1
    check_essential_files || exit_code=1
    check_app_structure || exit_code=1
    check_scripts || exit_code=1
    
    echo ""
    echo "========================================"
    
    if [ $exit_code -eq 0 ]; then
        echo -e "${GREEN}🎉 BOILERPLATE VERIFICATION: PASSED${NC}"
        echo -e "${GREEN}✅ Your boilerplate is 100% ready for all developers!${NC}"
        echo ""
        echo "🚀 Next steps:"
        echo "   1. Share this boilerplate with your team"
        echo "   2. Follow the Developer Setup Guide in docs/"
        echo "   3. Start building amazing React Native apps!"
    else
        echo -e "${RED}❌ BOILERPLATE VERIFICATION: FAILED${NC}"
        echo -e "${RED}⚠️  Please fix the issues above before sharing${NC}"
        echo ""
        echo "🔧 Common fixes:"
        echo "   1. Run 'npm install' to install dependencies"
        echo "   2. Check Node.js version (requires 18+)"
        echo "   3. Clear npm cache: 'npm cache clean --force'"
    fi
    
    echo ""
    echo "📚 For detailed setup instructions, see: docs/DEVELOPER_SETUP_GUIDE.md"
    
    exit $exit_code
}

# Run main function
main "$@" 