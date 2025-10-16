export const API_BASE = 'https://www.themealdb.com/api/json/v1/1';

export type Meal = {
  idMeal: string;
  strMeal: string;
  strMealThumb: string;
  strInstructions: string;
  strYoutube: string;
};

export type MealCategory = {
  idCategory: string;
  strCategory: string;
  strCategoryThumb: string;
  strCategoryDescription: string;
};

// Fetch meals by first letter
export const fetchMealsByLetter = async (letter: string): Promise<Meal[]> => {
  const res = await fetch(`${API_BASE}/search.php?f=${letter}`);
  const data = await res.json();
  return data.meals || [];
};

// Fetch meal by ID
export const fetchMealById = async (id: string): Promise<Meal> => {
  const res = await fetch(`${API_BASE}/lookup.php?i=${id}`);
  const data = await res.json();
  return data.meals[0];
};

// Fetch a random meal
export const fetchRandomMeal = async (): Promise<Meal> => {
  const res = await fetch(`${API_BASE}/random.php`);
  const data = await res.json();
  return data.meals[0];
};

export const getCategories = async (): Promise<MealCategory[]> => {
  const res = await fetch(`${API_BASE}/categories.php`);
  const data = await res.json();
  return data.categories || [];
};

export const getMealById = async (id: string): Promise<Meal> => {
  const res = await fetch(
    `https://www.themealdb.com/api/json/v1/1/lookup.php?i=${id}`,
  );
  const data = await res.json();
  return data.meals[0];
};

export const getMealsByCategory = async (category: string) => {
  const res = await fetch(
    `https://www.themealdb.com/api/json/v1/1/lookup.php?i=${category}`,
  );
  const data = await res.json();
  return data.meals;
};
