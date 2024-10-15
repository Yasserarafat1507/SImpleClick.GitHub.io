class CategoryData {
  final String name;
  final String icon;

  CategoryData({
    required this.name, 
    required this.icon
    });
  }

  final listCategory = [
    CategoryData(name: "Flash Deal ", icon: "assets/icons/Flash Icon.svg"),
    CategoryData(name: "Bill ", icon: "assets/icons/Bill Icon.svg"),
    CategoryData(name: "Game ", icon: "assets/icons/Game Icon.svg"),
    CategoryData(name: "Daily Gift ", icon: "assets/icons/Gift Icon.svg"),
    CategoryData(name: "More", icon: "assets/icons/Discover.svg"),
  ];