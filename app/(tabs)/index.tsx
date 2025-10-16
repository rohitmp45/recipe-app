import type { Meal, MealCategory } from 'api/mealApi';
import { fetchRandomMeal, getCategories } from 'api/mealApi';
import CategoryList from 'components/CategoryList';
import CategoryMeals from 'components/CategoryMeals';
import FeaturedMealCard from 'components/FeaturedMealCard';
import { useRouter } from 'expo-router';
import { useEffect, useState } from 'react';
import { SafeAreaView, ScrollView, StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#fff' },
});

export default function HomeScreen() {
  const router = useRouter();
  const [featuredMeal, setFeaturedMeal] = useState<Meal | null>(null);
  const [categories, setCategories] = useState<MealCategory[]>([]);
  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);

  const loadData = async () => {
    const [meal, cat] = await Promise.all([fetchRandomMeal(), getCategories()]);
    setFeaturedMeal(meal);
    setCategories(cat);
  };

  useEffect(() => {
    loadData();
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView>
        {/* Featured Meal */}
        {featuredMeal && (
          <FeaturedMealCard
            meal={featuredMeal}
            onPress={() => router.push(`/meal/${featuredMeal.idMeal}`)}
          />
        )}

        {/* Category Horizontal List */}
        <CategoryList categories={categories} onPress={setSelectedCategory} />

        {/* Category Meals */}
        {selectedCategory && (
          <CategoryMeals
            category={selectedCategory}
            key={selectedCategory} // ensures re-render & unique key
          />
        )}
      </ScrollView>
    </SafeAreaView>
  );
}
