import { Ionicons } from '@expo/vector-icons';
import type { Meal } from 'api/mealApi';
import {
  ImageBackground,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';

interface Props {
  meal: Meal;
  onPress: () => void;
}

const styles = StyleSheet.create({
  container: { marginBottom: 16 },
  image: { width: '100%', height: 250, justifyContent: 'flex-end' },
  overlay: {
    backgroundColor: 'rgba(0,0,0,0.35)',
    padding: 12,
    borderBottomLeftRadius: 12,
    borderBottomRightRadius: 12,
  },
  title: { color: '#fff', fontSize: 22, fontWeight: 'bold', marginBottom: 8 },
  infoRow: { flexDirection: 'row', alignItems: 'center' },
  infoText: { color: '#fff', marginLeft: 4, fontSize: 14 },
});
export default function FeaturedMealCard({ meal, onPress }: Props) {
  return (
    <TouchableOpacity style={styles.container} onPress={onPress}>
      <ImageBackground
        source={{ uri: meal.strMealThumb }}
        style={styles.image}
        imageStyle={{ borderRadius: 12 }}
      >
        <View style={styles.overlay}>
          <Text style={styles.title}>{meal.strMeal}</Text>
          <View style={styles.infoRow}>
            <Ionicons name="location-outline" size={16} color="#fff" />
            <Text style={styles.infoText}>{meal.strArea || 'Unknown'}</Text>

            <Ionicons
              name="time-outline"
              size={16}
              color="#fff"
              style={{ marginLeft: 12 }}
            />
            <Text style={styles.infoText}>30 mins</Text>

            <Ionicons
              name="people-outline"
              size={16}
              color="#fff"
              style={{ marginLeft: 12 }}
            />
            <Text style={styles.infoText}>4</Text>
          </View>
        </View>
      </ImageBackground>
    </TouchableOpacity>
  );
}
