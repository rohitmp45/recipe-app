// Define a type for theme color structure
export interface Theme {
  primary: string;
  background: string;
  text: string;
  border: string;
  white: string;
  textLight: string;
  card: string;
  shadow: string;
}

// Define each theme object
export const coffeeTheme: Theme = {
  primary: "#8B593E",
  background: "#FFF8F3",
  text: "#4A3428",
  border: "#E5D3B7",
  white: "#FFFFFF",
  textLight: "#9A8478",
  card: "#FFFFFF",
  shadow: "#000000",
};

export const forestTheme: Theme = {
  primary: "#2E7D32",
  background: "#E8F5E9",
  text: "#1B5E20",
  border: "#C8E6C9",
  white: "#FFFFFF",
  textLight: "#66BB6A",
  card: "#FFFFFF",
  shadow: "#000000",
};

export const purpleTheme: Theme = {
  primary: "#6A1B9A",
  background: "#F3E5F5",
  text: "#4A148C",
  border: "#D1C4E9",
  white: "#FFFFFF",
  textLight: "#BA68C8",
  card: "#FFFFFF",
  shadow: "#000000",
};

export const oceanTheme: Theme = {
  primary: "#0277BD",
  background: "#E1F5FE",
  text: "#01579B",
  border: "#B3E5FC",
  white: "#FFFFFF",
  textLight: "#4FC3F7",
  card: "#FFFFFF",
  shadow: "#000000",
};

export const sunsetTheme: Theme = {
  primary: "#FF7E67",
  background: "#FFF3F0",
  text: "#2C1810",
  border: "#FFD5CC",
  white: "#FFFFFF",
  textLight: "#FFA494",
  card: "#FFFFFF",
  shadow: "#000000",
};

export const mintTheme: Theme = {
  primary: "#00B5B5",
  background: "#E8F6F6",
  text: "#006666",
  border: "#B2E8E8",
  white: "#FFFFFF",
  textLight: "#66D9D9",
  card: "#FFFFFF",
  shadow: "#000000",
};

export const midnightTheme: Theme = {
  primary: "#2C3E50",
  background: "#F4F6F7",
  text: "#1A2530",
  border: "#D5D8DC",
  white: "#FFFFFF",
  textLight: "#7F8C8D",
  card: "#FFFFFF",
  shadow: "#000000",
};

export const roseGoldTheme: Theme = {
  primary: "#E0BFB8",
  background: "#FDF6F5",
  text: "#4A3B38",
  border: "#F2D9D5",
  white: "#FFFFFF",
  textLight: "#C9A9A6",
  card: "#FFFFFF",
  shadow: "#000000",
};

// Group all themes
export const THEMES: Record<string, Theme> = {
  coffee: coffeeTheme,
  forest: forestTheme,
  purple: purpleTheme,
  ocean: oceanTheme,
  sunset: sunsetTheme,
  mint: mintTheme,
  midnight: midnightTheme,
  roseGold: roseGoldTheme,
};

// 👇 Change this to switch theme
export const COLORS: Theme = THEMES.purple;
