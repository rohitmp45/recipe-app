import type { Meal } from 'api/mealApi';
import { getMealById } from 'api/mealApi';
import { useLocalSearchParams } from 'expo-router';
import { useEffect, useState } from 'react';
import {
  ActivityIndicator,
  Image,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16, backgroundColor: '#fff' },
  title: { fontSize: 24, fontWeight: 'bold', marginBottom: 12 },
  image: { width: '100%', height: 200, borderRadius: 12, marginBottom: 12 },
  instructions: { fontSize: 14, lineHeight: 20 },
});
export default function MealDetailScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const [meal, setMeal] = useState<Meal | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadMeal = async () => {
      if (!id) return;
      const data = await getMealById(id);
      setMeal(data);
      setLoading(false);
    };
    loadMeal();
  }, [id]);

  if (loading)
    return <ActivityIndicator style={{ flex: 1 }} size="large" color="#000" />;

  if (!meal) return <Text>Meal not found</Text>;

  return (
    <ScrollView style={styles.container}>
      <Text style={styles.title}>{meal.strMeal}</Text>
      <Image source={{ uri: meal.strMealThumb }} style={styles.image} />
      <Text style={styles.instructions}>{meal.strInstructions}</Text>
      {meal.strYoutube && (
        <View style={{ height: 200, marginTop: 16 }}>
          <WebView
            source={{ uri: meal.strYoutube.replace('watch?v=', 'embed/') }}
          />
        </View>
      )}
    </ScrollView>
  );
}
