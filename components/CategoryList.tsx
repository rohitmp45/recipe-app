import type { MealCategory } from 'api/mealApi';
import {
  FlatList,
  Image,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';

interface Props {
  categories: MealCategory[];
  onPress: (category: string) => void;
  selectedCategory: string | null;
}

const styles = StyleSheet.create({
  container: { marginVertical: 16 },
  catItem: {
    marginRight: 12,
    alignItems: 'center',
    padding: 6,
    borderRadius: 12,
  },
  catImage: { width: 80, height: 80, borderRadius: 40 },
  catText: { marginTop: 4, textAlign: 'center', fontWeight: '600' },
  activeBorder: {
    borderWidth: 2,
    borderColor: '#FF6347',
  },
});

export default function CategoryList({
  categories,
  onPress,
  selectedCategory,
}: Props) {
  if (!categories?.length) return null;

  return (
    <View style={styles.container}>
      <FlatList
        horizontal
        data={categories}
        keyExtractor={(item) => item.idCategory.toString()}
        showsHorizontalScrollIndicator={false}
        contentContainerStyle={{ paddingHorizontal: 16 }}
        renderItem={({ item }) => {
          const isActive = selectedCategory === item.strCategory;
          return (
            <TouchableOpacity
              style={[styles.catItem, isActive && styles.activeBorder]}
              onPress={() => onPress(item.strCategory)}
            >
              <Image
                source={{ uri: item.strCategoryThumb }}
                style={styles.catImage}
              />
              <Text style={styles.catText}>{item.strCategory}</Text>
            </TouchableOpacity>
          );
        }}
      />
    </View>
  );
}
