import { useAuth } from '@clerk/clerk-expo';
import { Redirect, Stack } from 'expo-router';
import type React from 'react';

const AuthRoutesLayout: React.FC = () => {
  const { isSignedIn } = useAuth();

  if (isSignedIn) {
    return <Redirect href="/" as any />;
  }

  return <Stack screenOptions={{ headerShown: false }} />;
};

export default AuthRoutesLayout;
