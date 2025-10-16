import * as SecureStore from 'expo-secure-store';

export const tokenCache = {
  getToken: (key: string) => SecureStore.getItemAsync(key),
  saveToken: (key: string, token: string) =>
    SecureStore.setItemAsync(key, token),
  clearToken: (key: string) => SecureStore.deleteItemAsync(key),
};
