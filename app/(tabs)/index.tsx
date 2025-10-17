import type { Meal, MealCategory } from 'api/mealApi';
import { fetchRandomMeal, getCategories } from 'api/mealApi';
import CategoryList from 'components/CategoryList';
import CategoryMeals from 'components/CategoryMeals';
import FeaturedMealCard from 'components/FeaturedMealCard';
import { useRouter } from 'expo-router';
import { useEffect, useState } from 'react';
import { FlatList, SafeAreaView, StyleSheet, View } from 'react-native';

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

    // ✅ Automatically select the first category when loaded
    if (cat?.length > 0 && !selectedCategory) {
      setSelectedCategory(cat[0].strCategory);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <FlatList
        data={[]} // Dummy FlatList to enable scroll
        keyExtractor={(_, index) => index.toString()}
        renderItem={null}
        ListHeaderComponent={
          <View>
            {/* ✅ Featured Meal */}
            {featuredMeal && (
              <FeaturedMealCard
                meal={featuredMeal}
                onPress={() => router.push(`/meal/${featuredMeal.idMeal}`)}
              />
            )}

            {/* ✅ Category Horizontal List */}
            <CategoryList
              categories={categories}
              selectedCategory={selectedCategory}
              onPress={(cat) => setSelectedCategory(cat)}
            />

            {/* ✅ Meals under selected category */}
            {selectedCategory ? (
              <CategoryMeals
                key={selectedCategory}
                category={selectedCategory}
              />
            ) : null}
          </View>
        }
      />
    </SafeAreaView>
  );
}
