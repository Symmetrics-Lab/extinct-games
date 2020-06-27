class Animal {
  String name;
  String sciName;
  String amount;
  String heroImageName;
  String description;
  String endangerment;
  String location;

  Animal(
    this.name,
    this.sciName,
    this.amount,
    this.heroImageName,
    this.description,
    this.endangerment,
    this.location,
  );
}

List<Animal> allAnimals = [
  Animal(
      'Tiger',
      'Panthera tigris',
      'Around 3900',
      'assets/Tiger.jpg',
      'There are two recognized subspecies of tiger*: the continental (Panthera tigris tigris) and the Sunda (Panthera tigris sondaica). The largest of all the Asian big cats  tigers rely primarily on sight and sound rather than smell for hunting. They typically hunt alone and stalk prey. A tiger can consume more than 80 pounds of meat at one time. On average  tigers give birth to two to four cubs every two years. If all the cubs in one litter die  a second litter may be produced within five months. Tigers generally gain independence at around two years of age and attain sexual maturity at age three or four for females and four or five years for males. Juvenile mortality is high  however—about half of all cubs do not survive more than two years. Tigers have been known to reach up to 20 years of age in the wild. Males of the larger subspecies  the continental tiger  may weigh up to 660 pounds. For males of the smaller subspecies—the Sunda tiger—the upper range is at around 310 pounds. Within both subspecies  males are heavier than females. Tigers are mostly solitary  apart from associations between mother and offspring. Individual tigers have a large territory  and the size is determined mostly by the availability of prey. Individuals mark their domain with urine  feces  rakes  scrapes  and vocalizing. Across their range  tigers face unrelenting pressures from poaching  retaliatory killings  and habitat loss. They are forced to compete for space with dense and often growing human populations.',
      'Endangered',
      'India, China, Southeast Asia'),
];
