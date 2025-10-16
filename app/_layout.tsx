import { ClerkProvider } from '@clerk/clerk-expo';
import SafeScreen from 'components/SafeScreen';
import { Slot } from 'expo-router';

import { tokenCache } from '../utils/tokenCache'; // Adjust the path as necessary

export default function RootLayout() {
  return (
    <ClerkProvider tokenCache={tokenCache}>
      <SafeScreen>
        <Slot />
      </SafeScreen>
    </ClerkProvider>
  );
}
