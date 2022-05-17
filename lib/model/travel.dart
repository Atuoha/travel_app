class Travel {
  //model variables
  final int id;
  final String name;
  final String description;
  final int duration;
  final String location;
  final double rating;
  final int distance;
  final double cost;
  final List<String> imageUrl;

  //model constuctor
  Travel(
    this.id,
    this.name,
    this.duration,
    this.description,
    this.location,
    this.rating,
    this.distance,
    this.imageUrl,
    this.cost,
  );
}
