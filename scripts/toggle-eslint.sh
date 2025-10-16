#!/bin/bash

# Toggle ESLint based on Node.js version
echo "🔧 Toggling ESLint configuration..."

# Check Node.js version
NODE_VERSION=$(node --version)
REQUIRED_VERSION="v18"

if [[ "$NODE_VERSION" == v18* ]] || [[ "$NODE_VERSION" == v19* ]] || [[ "$NODE_VERSION" == v20* ]] || [[ "$NODE_VERSION" == v21* ]]; then
    echo "✅ Node.js version: $NODE_VERSION (Compatible with ESLint)"
    echo "🔄 Enabling ESLint in lint-staged..."
    
    # Enable ESLint in lint-staged
    sed -i 's|// ESLint removed to avoid Node.js version issues|// ESLint enabled for Node.js 18+|g' lint-staged.config.js
    sed -i 's|// '\''\*\.{js,jsx,ts,tsx}'\'': \['\''eslint --fix'\'', '\''eslint'\''\],|'\''\*\.{js,jsx,ts,tsx}'\'': \['\''eslint --fix'\'', '\''eslint'\''\],|g' lint-staged.config.js
    sed -i 's|// Uncomment the line below when you upgrade to Node.js 18+|// ESLint is now enabled|g' lint-staged.config.js
    
    echo "✅ ESLint enabled! It will now run during commits."
else
    echo "⚠️  Node.js version: $NODE_VERSION (Incompatible with ESLint)"
    echo "🔄 Disabling ESLint in lint-staged..."
    
    # Disable ESLint in lint-staged
    sed -i 's|// ESLint enabled for Node.js 18+|// ESLint removed to avoid Node.js version issues|g' lint-staged.config.js
    sed -i 's|'\''\*\.{js,jsx,ts,tsx}'\'': \['\''eslint --fix'\'', '\''eslint'\''\],|// '\''\*\.{js,jsx,ts,tsx}'\'': \['\''eslint --fix'\'', '\''eslint'\''\],|g' lint-staged.config.js
    sed -i 's|// ESLint is now enabled|// Uncomment the line below when you upgrade to Node.js 18+|g' lint-staged.config.js
    
    echo "✅ ESLint disabled! It will not run during commits."
fi

echo ""
echo "📋 Current lint-staged configuration:"
cat lint-staged.config.js 