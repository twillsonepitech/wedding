class Menues {
  String title;
  String typeOfMenu;
  int ratePerMenu;
  String description;
  String imgUrl;

  Menues(this.title, this.typeOfMenu, this.ratePerMenu, this.description, this.imgUrl, this.servings);

  static List<Menues> samples = [
    Menues(
      'Silver Package',
      'Buffet',
      30,
      "A delightful buffet with a variety of appetizers, main courses, and desserts. Perfect for a small and intimate wedding celebration.",
      "assets/silver_menu.jpeg",
      1
    ),
    Menues(
      'Gold Package',
      'Plated Dinner',
      50,
      "A luxurious plated dinner experience featuring gourmet dishes. Ideal for a medium-sized wedding with an elegant touch.",
      "assets/gold_menu.jpeg",
      1
    ),
    Menues(
      'Platinum Package',
      'Customized Menu',
      75,
      "Tailor your menu to perfection! Work with our chef to create a personalized menu that suits your taste and preferences for a grand wedding affair.",
      "assets/platinum_menu.jpeg",
      1
    ),
    Menues(
      'Dessert Package',
      'Buffet',
      20,
      "Satisfy your sweet tooth with an array of decadent desserts, cakes, and pastries. Perfect for those who want to focus on the sweet side of the celebration.",
      "assets/dessert_package.jpeg",
      1
    ),
    Menues(
      'Additional Package',
      'Late-Night Snacks',
      15,
      "Keep the party going with a selection of late-night snacks. From sliders to nachos, this package ensures your guests stay energized and entertained.",
      "assets/late_night_snack.jpeg",
      1
    ),
  ];
  int servings;
}
