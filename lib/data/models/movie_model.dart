class Movie {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String category;

  Movie({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.category,
  });
}

// movies
final List<Movie> movies = [
  Movie(
    title: "GANGERS (TAMIL)",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/gangers.avif",
    category: "Now Showing",
  ),
  Movie(
    title: "RANI (SINHALA)",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/rani.jpg",
    category: "Now Showing",
  ),
  Movie(
    title: "AKASA KUSUM",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/akasa_kusum.jpg",
    category: "Now Showing",
  ),
  Movie(
    title: "BHOOTNII",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/bhootnii.jpg",
    category: "Scope Exclusives",
  ),
  Movie(
    title: "LILO & STITCH",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/lilo_stitch.jpg",
    category: "Scope Exclusives",
  ),
  Movie(
    title: "FINAL DESTINATION",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/final_destination.jpg",
    category: "Scope Exclusives",
  ),
  Movie(
    title: "MISSION IMPOSSIBLE",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/mission_impossible.jpg",
    category: "Coming Soon",
  ),
  Movie(
    title: "MINECRAFT",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/minecraft.jpg",
    category: "Coming Soon",
  ),
  Movie(
    title: "HIT",
    subtitle: "IN THEATERS NOW",
    imageUrl: "assets/images/hit.jpg",
    category: "Coming Soon",
  ),
];
