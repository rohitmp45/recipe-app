import type { Meal } from 'api/mealApi';
import { fetchMealById } from 'api/mealApi';
import { COLORS } from 'constants/colors';
import { useLocalSearchParams, useRouter } from 'expo-router';
import { useEffect, useState } from 'react';
import {
  ActivityIndicator,
  Image,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import { WebView } from 'react-native-webview';

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16, backgroundColor: COLORS.background },
  back: { fontSize: 16, color: 'blue', marginBottom: 12 },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginVertical: 12,
    color: COLORS.text,
  },
  image: { width: '100%', height: 250, borderRadius: 12, marginBottom: 12 },
  instructions: {
    fontSize: 14,
    lineHeight: 20,
    marginBottom: 16,
    color: COLORS.text,
  },
  youtube: { fontSize: 16, color: 'red', marginTop: 12 },
});

export default function MealDetail() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const router = useRouter();

  const [meal, setMeal] = useState<Meal | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadMeal = async () => {
      if (!id) return;
      setLoading(true);
      const data = await fetchMealById(id);
      setMeal(data);
      setLoading(false);
    };
    loadMeal();
  }, [id]);

  if (loading)
    return (
      <View
        style={[
          styles.container,
          { justifyContent: 'center', alignItems: 'center' },
        ]}
      >
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );

  if (!meal) return <Text style={styles.container}>Meal not found</Text>;

  return (
    <ScrollView style={styles.container}>
      <TouchableOpacity onPress={() => router.back()}>
        <Text style={styles.back}>⬅ Back</Text>
      </TouchableOpacity>

      <Text style={styles.title}>{meal.strMeal}</Text>
      <Image source={{ uri: meal.strMealThumb }} style={styles.image} />
      <Text style={styles.instructions}>{meal.strInstructions}</Text>

      {meal?.strYoutube ? (
        <View style={{ height: 200, marginTop: 12 }}>
          <WebView
            source={{
              uri: meal?.strYoutube.replace('watch?v=', 'embed/'),
            }}
            javaScriptEnabled
            domStorageEnabled
          />
        </View>
      ) : null}
    </ScrollView>
  );
}
