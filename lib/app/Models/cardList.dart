class ShoppingListData {
  ShoppingListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.description = '',
    this.price = '',
    this.detail = '',
    this.totalPrice = '',
  });

  String imagePath;
  String titleTxt;
  String description;
  String price;
  String detail;
  String totalPrice;

  // ignore: non_constant_identifier_names
  static List<ShoppingListData> TabIconList = <ShoppingListData>[
    ShoppingListData(
      imagePath: 'assets/images/football.png',
      titleTxt: 'Football',
      price: "Rs. 01",
      description: 'solid, grey, green',
      // img: 'assets/images/football.png',
      // imgTitle: 'Football',
      detail:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare. Vivamus vehicula turpis ac tellus fermentum commodo',
      totalPrice: "Rs. 01",
    ),
    ShoppingListData(
      imagePath: 'assets/images/bed.png',
      titleTxt: 'Bed',
      price: "Rs. 01",
      description: 'solid, grey, orange',

      // img: 'assets/images/bed.png',
      // imgTitle: 'Bed',
      detail:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare. Vivamus vehicula turpis ac tellus fermentum commodo',
      totalPrice: "Rs. 01",
    ),
    ShoppingListData(
      imagePath: 'assets/images/chair.png',
      titleTxt: 'Chair',
      price: "Rs. 01",
      description: 'solid, grey, blue',
      // img: 'assets/images/chair.png',
      // imgTitle: 'Chair',
      detail:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare. Vivamus vehicula turpis ac tellus fermentum commodo',
      totalPrice: "Rs. 01",
    ),
    ShoppingListData(
      imagePath: 'assets/images/table.png',
      titleTxt: 'Table',
      price: "Rs. 01",
      description: 'Red, blue, white',
      // img: 'assets/images/table.png',
      // imgTitle: 'Table',
      detail:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ut massa quis neque aliquet ornare. Vivamus vehicula turpis ac tellus fermentum commodo',
      totalPrice: 'Rs. 01',
    ),
  ];
}
