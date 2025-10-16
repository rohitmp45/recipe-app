import type { Meal } from 'api/mealApi';
import { getMealsByCategory } from 'api/mealApi';
import { useRouter } from 'expo-router';
import { useEffect, useState } from 'react';
import {
  FlatList,
  Image,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';

interface Props {
  category: string;
}

const styles = StyleSheet.create({
  sectionTitle: { fontSize: 20, fontWeight: 'bold', marginBottom: 12 },
  mealCard: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 8,
    padding: 8,
  },
  mealThumb: { width: 80, height: 80, borderRadius: 8, marginRight: 12 },
  mealName: { fontSize: 16, fontWeight: '600' },
});

export default function CategoryMeals({ category }: Props) {
  const router = useRouter();
  const [meals, setMeals] = useState<Meal[]>([]);
  const [loading, setLoading] = useState(false);
  console.log('catmeal23', meals);
  useEffect(() => {
    const loadMeals = async () => {
      setLoading(true);
      const data = await getMealsByCategory(category);
      setMeals(data);
      setLoading(false);
    };
    loadMeals();
  }, [category]);

  if (loading) return <Text style={{ padding: 16 }}>Loading...</Text>;

  return (
    <View style={{ marginTop: 16, paddingHorizontal: 16 }}>
      <Text style={styles.sectionTitle}>{category} Meals</Text>
      <FlatList
        data={meals}
        keyExtractor={(item) => item.idMeal}
        renderItem={({ item }) => (
          <TouchableOpacity
            style={styles.mealCard}
            onPress={() => router.push(`/meal/${item.idMeal}`)}
          >
            <Image
              source={{ uri: item.strMealThumb }}
              style={styles.mealThumb}
            />
            <Text style={styles.mealName}>{item.strMeal}</Text>
          </TouchableOpacity>
        )}
      />
    </View>
  );
}
