#!/bin/bash

# Enable Git hooks for Node.js 18+ users
echo "🔧 Enabling Git hooks..."

# Check Node.js version
NODE_VERSION=$(node --version)
REQUIRED_VERSION="v18"

if [[ "$NODE_VERSION" == v18* ]] || [[ "$NODE_VERSION" == v19* ]] || [[ "$NODE_VERSION" == v20* ]] || [[ "$NODE_VERSION" == v21* ]]; then
    echo "✅ Node.js version: $NODE_VERSION (Compatible with Git hooks)"
    
    # Re-enable pre-commit hook
    if [ -f ".husky/pre-commit.disabled" ]; then
        mv .husky/pre-commit.disabled .husky/pre-commit
        echo "✅ Pre-commit hook re-enabled"
    else
        echo "ℹ️  Pre-commit hook already enabled"
    fi
    
    # Enable ESLint in lint-staged
    ./scripts/toggle-eslint.sh
    
    echo "✅ All Git hooks enabled!"
    echo "📝 You can now commit with full linting and type checking."
else
    echo "⚠️  Node.js version: $NODE_VERSION (Incompatible with Git hooks)"
    echo "❌ Please upgrade to Node.js 18+ to enable Git hooks"
    echo "💡 Run: nvm install 18.19.0 && nvm use 18.19.0"
fi 