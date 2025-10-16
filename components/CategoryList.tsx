import type { MealCategory } from 'api/mealApi';
import {
  FlatList,
  Image,
  StyleSheet,
  Text,
  TouchableOpacity,
} from 'react-native';

interface Props {
  categories: MealCategory[];
  onPress: (category: string) => void;
}

const styles = StyleSheet.create({
  catItem: { marginRight: 12, alignItems: 'center' },
  catImage: { width: 80, height: 80, borderRadius: 40 },
  catText: { marginTop: 4, textAlign: 'center', fontWeight: '600' },
});

export default function CategoryList({ categories, onPress }: Props) {
  return (
    <FlatList
      horizontal
      showsHorizontalScrollIndicator={false}
      data={categories}
      keyExtractor={(item) => item.idCategory} // unique key
      contentContainerStyle={{ paddingHorizontal: 16, paddingVertical: 12 }}
      renderItem={({ item }) => (
        <TouchableOpacity
          style={styles.catItem}
          onPress={() => onPress(item.strCategory)}
        >
          <Image
            source={{ uri: item.strCategoryThumb }}
            style={styles.catImage}
          />
          <Text style={styles.catText}>{item.strCategory}</Text>
        </TouchableOpacity>
      )}
    />
  );
}
