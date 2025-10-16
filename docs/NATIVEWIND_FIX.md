# 🔧 NativeWind Async Plugin Fix

This guide fixes the "Use process(css).then(cb) to work with async plugins" error that can occur with NativeWind.

## 🚨 Error Description

**Error Message:**
```
Main.tsx: Use process(css).then(cb) to work with async plugins
```

**Cause:** This error occurs when NativeWind's CSS processing encounters async operations that aren't properly handled.

## ✅ Solutions

### Solution 1: Update NativeWind Configuration (Recommended)

The boilerplate has been updated with the latest NativeWind configuration:

#### Updated `tailwind.config.js`:
```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.{js,ts,jsx,tsx}',
    './app/**/*.{js,ts,jsx,tsx}',
    './Main.tsx',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eff6ff',
          100: '#dbeafe',
          200: '#bfdbfe',
          300: '#93c5fd',
          400: '#60a5fa',
          500: '#3b82f6',
          600: '#2563eb',
          700: '#1d4ed8',
          800: '#1e40af',
          900: '#1e3a8a',
        },
      },
    },
  },
  plugins: [],
  // NativeWind v2 configuration - disable preflight for React Native
  corePlugins: {
    preflight: false,
  },
};
```

#### Updated `metro.config.js`:
```javascript
const { getDefaultConfig } = require('expo/metro-config');

/** @type {import('expo/metro-config').MetroConfig} */
const config = getDefaultConfig(__dirname);

module.exports = config;
```

### Solution 2: Clear Cache and Restart

If you're still experiencing issues:

```bash
# Clear Expo cache
npx expo start --clear

# Or clear all caches
npm run clean
npx expo start --clear
```

### Solution 3: Update NativeWind Version

Ensure you have the latest NativeWind version:

```bash
npm install nativewind@latest --save
```

### Solution 4: Check Babel Configuration

Ensure your `babel.config.js` includes NativeWind:

```javascript
module.exports = (api) => {
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
    plugins: [
      'nativewind/babel',  // This is required
      [
        'module-resolver',
        {
          alias: {
            '@': './src',
          },
        },
      ],
      require.resolve('expo-router/babel'),
    ],
  };
};
```

## 🔍 Verification

After applying the fixes, verify that NativeWind is working:

```bash
# Start the development server
npm start

# Check if the app loads without the async plugin error
```

## 🎯 Expected Behavior

After the fix:
- ✅ No "Use process(css).then(cb)" error
- ✅ NativeWind styles work correctly
- ✅ Hot reload works properly
- ✅ CSS classes are applied to components

## 🚀 Quick Fix Script

If you're experiencing issues, run this quick fix:

```bash
#!/bin/bash

echo "🔧 Fixing NativeWind async plugin issue..."

# Update NativeWind
npm install nativewind@latest --save

# Clear caches
npx expo start --clear

echo "✅ NativeWind fix applied!"
```

## 📚 Additional Resources

- [NativeWind Documentation](https://www.nativewind.dev/)
- [Expo Metro Configuration](https://docs.expo.dev/guides/customizing-metro/)
- [Tailwind CSS Configuration](https://tailwindcss.com/docs/configuration)

---

*Last updated: August 5, 2024*
*This fix is included in the latest boilerplate version* 