class Menues {
  String title;
  String typeOfMenu;
  int numberOfGuests;
  int ratePerMenu;
  String description;
  String imgUrl;
  Menues(this.title, this.typeOfMenu, this.numberOfGuests, this.ratePerMenu, this.description, this.imgUrl);

  static List<Menues> samples = [
    Menues(
      'Silver Package',
      'Buffet',
      50,
      30,
      "A delightful buffet with a variety of appetizers, main courses, and desserts. Perfect for a small and intimate wedding celebration.",
      "assets/silver_menu.jpeg"
    ),
    Menues(
      'Gold Package',
      'Plated Dinner',
      100,
      50,
      "A luxurious plated dinner experience featuring gourmet dishes. Ideal for a medium-sized wedding with an elegant touch.",
      "assets/gold_menu.jpeg"
    ),
    Menues(
      'Platinum Package',
      'Customized Menu',
      150,
      75,
      "Tailor your menu to perfection! Work with our chef to create a personalized menu that suits your taste and preferences for a grand wedding affair.",
      "assets/platinum_menu.jpeg"
    ),
    Menues(
      'Dessert Package',
      'Buffet',
      50,
      20,
      "Satisfy your sweet tooth with an array of decadent desserts, cakes, and pastries. Perfect for those who want to focus on the sweet side of the celebration.",
      "assets/dessert_package.jpeg"
    ),
    Menues(
      'Additional Package',
      'Late-Night Snacks',
      75,
      15,
      "Keep the party going with a selection of late-night snacks. From sliders to nachos, this package ensures your guests stay energized and entertained.",
      "assets/late_night_snack.jpeg"
    ),
  ];
}
