import 'package:e_commerce_modernui/utils/assets.dart';

class ProductModel {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavourite;
  final String description;

  ProductModel(
      {required this.name,
      required this.category,
      required this.price,
      this.oldPrice,
      required this.imageUrl,
      this.isFavourite = false,
      required this.description});
}

final List<ProductModel> products = [
  ProductModel(
    name: "Shoes",
    category: "Footwear",
    price: 1800,
    oldPrice: 2990,
    imageUrl: Assets.shoe,
    description: "A shoe is an item of footwear intended to protect and comfort the human foot. Though the human foot can adapt to varied terrains and climate conditions, it is vulnerable, and shoes provide protection. Form was originally tied to function, but over time, shoes also became fashion items. Some shoes are worn as safety equipment, such as steel-toe boots, which are required footwear at industrial worksites.\nAdditionally, shoes have often evolved into many different designs; high heels, for instance, are most commonly worn by women during fancy occasions. Contemporary footwear varies vastly in style, complexity and cost. Basic sandals may consist of only a thin sole and simple strap and be sold for a low cost. High fashion shoes made by famous designers may be made of expensive materials, use complex construction and sell for large sums of money. Some shoes are designed for specific purposes, such as boots designed specifically for mountaineering or skiing, while others have more generalized usage such as sneakers which have transformed from a special purpose sport shoe into a general use shoe.\nTraditionally, shoes have been made from leather, wood or canvas, but are increasingly being made from rubber, plastics, and other petrochemical-derived materials.[1] Globally, the shoe industry is a 200 billion a year industry.[1] 90% of shoes end up in landfills, because the materials are hard to separate, recycle or otherwise reuse",
  ),
  ProductModel(
    isFavourite: true,
    name: "Laptop",
    category: "Electronics",
    price: 89000,
    oldPrice: 120000,
    imageUrl: Assets.laptop,
    description:
        "A laptop, sometimes called a notebook computer by manufacturers, is a battery- or AC-powered personal computer (PC) smaller than a briefcase. A laptop can be easily transported and used in temporary spaces such as on airplanes, in libraries, temporary offices and at meetings.\nA laptop can be turned into a desktop computer with a docking station, which is a hardware frame that supplies connections for peripheral input/output devices such as a monitor, keyboard and printer.",
  ),
  ProductModel(
    name: "Jorden Shoes",
    category: "Footwear",
    price: 4999,
    isFavourite: true,
    oldPrice: 7600,
    imageUrl: Assets.shoe2,
    description: "Air Jordan is a line of basketball and sportswear shoes produced by Nike, Inc. Related apparel and accessories are marketed under Jordan Brand.\nThe first Air Jordan shoe was produced for basketball player Michael Jordan during his time with the Chicago Bulls on November 17, 1984, and released to the public on April 1, 1985.[2][3] The shoes were designed for Nike by Peter Moore, Tinker Hatfield, and Bruce Kilgore.\nThe Jordan Logo, known as the Jumpman, originated from a photograph by Jacobus Rentmeester, taken before Jordan played for Team USA in the 1984 Summer Olympics.\nAs Michael Jordan entered his rookie year in 1984, he was approached to sign a shoe deal with Adidas, Converse, and Nike. In their meeting with Jordan, Nike centered its presentation around a highlight video of Jordan's various slam dunks, scored to Jump (For My Love)by the Pointer Sisters. Nike showcased the first design of the shoe, but Jordan criticized its colorway. While other companies saw Jordan as a figure for promoting preexisting shoe lines, Nike took Jordan's criticism into account to make him a stand alone star and give him a signature shoe line",
  ),
  ProductModel(
    name: "Puma",
    category: "Footwear",
    price: 1650,
    oldPrice: 2500,
    imageUrl: Assets.shoes2,
    description: "Puma SE is a German multinational corporation which designs and manufactures athletic and casual footwear, apparel, and accessories, headquartered in Herzogenaurach, Bavaria, Germany. Puma is the third largest sportswear manufacturer in the world.[8] The company was founded in 1948 by Rudolf Dassler (1898–1974). In 1924, Rudolf and his brother Adolf Adi Dassler had jointly formed the company Gebrüder Dassler Schuhfabrik ('Dassler Brothers Shoe Factory'). The relationship between the two brothers deteriorated until they agreed to split in 1948, forming two separate entities, Adidas and Puma.\nFollowing the split, Rudolf originally registered the newly established company as Ruda (derived from Rudolf Dassler, as Adidas was based on Adi Dassler), but later changed the name to Puma. Puma's earliest logo consisted of a square and beast jumping through a D, which was registered, along with the company's name, in 1948. Puma's shoe and clothing designs feature the Puma logo and the distinctive Formstrip which was introduced in 1958.\nChristoph Dassler was a worker in a shoe factory, while his wife Pauline ran a small laundry in the Franconian town of Herzogenaurach, 20 km (12.4 mi) from the city of Nuremberg. After leaving school, their son, Rudolf Dassler, joined his father at the shoe factory. When he returned from fighting in World War I, Rudolf was trained as a salesman at a porcelain factory, and later in a leather trading business in Nuremberg.",
  ),
];

final List<String> sizeList = ["S", "M", "L", "XL"];

final List<String> category = ["All", "Men", "Women", "Girls"];
