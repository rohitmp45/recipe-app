import type { ReactNode } from 'react';
import type React from 'react';
import type { ViewStyle } from 'react-native';
import { View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { COLORS } from '../constants/colors';

// Define prop types
interface SafeScreenProps {
  children: ReactNode;
  style?: ViewStyle; // optional additional styling
}

const SafeScreen: React.FC<SafeScreenProps> = ({ children, style }) => {
  const insets = useSafeAreaInsets();

  return (
    <View
      style={[
        {
          flex: 1,
          paddingTop: insets.top,
          backgroundColor: COLORS.background,
        },
        style,
      ]}
    >
      {children}
    </View>
  );
};

export default SafeScreen;
