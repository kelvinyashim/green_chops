import 'package:flutter/material.dart';
import 'package:green_chops/model/category.dart';
import 'package:green_chops/model/meal.dart';

const availableCategories = [
  Categorys(
    id: 'c1',
    title: 'Traditional',
    color: Colors.purple,
  ),
  Categorys(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Categorys(
    id: 'c3',
    title: 'Street Food',
    color: Colors.orange,
  ),
  Categorys(
    id: 'c4',
    title: 'Local Delicacies',
    color: Colors.amber,
  ),
  Categorys(
    id: 'c5',
    title: 'Healthy Choices',
    color: Colors.blue,
  ),
  Categorys(
    id: 'c6',
    title: 'Exotic Choices',
    color: Colors.green,
  ),
  Categorys(
    id: 'c7',
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Categorys(
    id: 'c8',
    title: 'African Fusion',
    color: Colors.lightGreen,
  ),
  Categorys(
    id: 'c9',
    title: 'Spicy Delights',
    color: Colors.pink,
  ),
  Categorys(
    id: 'c10',
    title: 'Seasonal Specials',
    color: Colors.teal,
  ),
];


const specialMeals = [

  // Vegan only
  Meal(
    id: 'm7',
    categories: ['c4', 'c10'],
    title: 'Vegan Pounded Yam with Oha Soup',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: "https://img.cdn4dd.com/p/fit=cover,width=1200,height=1200,format=auto,quality=90/media/photosV2/affbae20-dfb0-49e2-8aa5-18eca4d9316d-retina-large.jpg",
    duration: 60,
    ingredients: [
      'Pounded Yam (made from plantains or yams)',
      'Oha Leaves',
      'Stock',
      'Cocoyam (for thickening)',
      'Spices',
    ],
    steps: [
      'Prepare pounded yam using plantains or yams.',
      'Cook oha leaves in a seasoned stock.',
      'Thicken the soup with cocoyam paste.',
      'Serve the vegan pounded yam with oha soup hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  // Vegan and gluten-free
  Meal(
    id: 'm8',
    categories: ['c10', 'c5', 'c6'],
    title: 'Coconut Rice with Vegetable Curry',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://www.everydayeileen.com/wp-content/uploads/2018/02/coconut-curry-rice-and-vegetables.jpg',
    duration: 45,
    ingredients: [
      'Basmati Rice',
      'Coconut Milk',
      'Mixed Vegetables (e.g., Carrots, Peas, Bell Peppers)',
      'Curry Powder',
      'Spices',
    ],
    steps: [
      'Cook basmati rice with coconut milk and spices.',
      'In a separate pan, sauté mixed vegetables with curry powder.',
      'Combine the cooked rice and vegetable curry.',
      'Serve the vegan and gluten-free coconut rice hot.'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
   Meal(
    id: 'n1',
    categories: ['c10', 'c2'],
    title: 'Jollof Rice',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://example.com/jollof_rice.jpg',
    duration: 45,
    ingredients: ['Rice', 'Tomatoes', 'Onions', 'Spices'],
    steps: [
      'Wash the rice thoroughly.',
      'Blend tomatoes and onions to make a smooth paste.',
      'In a pot, combine rice, tomato-onion paste, and spices.',
      'Cook until the rice is tender and flavorful.',
      'Serve the delicious Jollof Rice!'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meal(
    id: 'n2',
    categories: ['c3', 'c4'],
    title: ' Semo and Egusi Soup',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: 'https://www.fmnfoods.com/wp-content/uploads/2021/03/EGUSI-WITH-BALL-8-1-500x375.jpg',
    duration: 60,
    ingredients: ['Ground Melon Seeds', 'Vegetables', 'Meat/Fish', 'Spices'],
    steps: [
     " You pour a little amount of semo in a bowl and add a little (ordinary) water.",
      'You heat water in a pot',
      'You pour the content (the semo you added to ordinary water) into the pot with water (still on the stove) and stir.'
      'Now for the egusi'
      'Prepare a rich stock with meat or fish.',
      'Add ground egusi seeds to thicken the soup.',
      'Add chopped vegetables and spices.',
      'Simmer until all ingredients are well-cooked.',
      'Enjoy the hearty Egusi Soup!'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  Meal(
    id: 'n3',
    categories: ['c5', 'c4'],
    title: 'Pounded Yam and Egusi Soup',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl: 'https://desirerecipes.com/wp-content/uploads/2022/02/image-24.jpg',
    duration: 90,
    ingredients: ['Pounded Yam', 'Ground Melon Seeds', 'Vegetables', 'Assorted Meats/Fish'],
    steps: [
      'Prepare pounded yam by boiling and pounding yams.',
      'Prepare a rich egusi soup with assorted meats or fish.',
      'Serve the pounded yam with the flavorful egusi soup.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  Meal(
  id: 'n19',
  categories: ['c1', 'c2'],
  title: 'Classic Spaghetti',
  affordability: Affordability.affordable,
  complexity: Complexity.medium,
  imageUrl: 'https://www.inspiredtaste.net/wp-content/uploads/2023/01/Spaghetti-with-Meat-Sauce-Recipe-Video.jpg',
  duration: 30,
  ingredients: ['Wheat-based Spaghetti', 'Tomato Sauce', 'Herbs', 'Cheese (optional)'],
  steps: [
    'Boil the spaghetti according to package instructions.',
    'Heat tomato sauce with herbs and spices.',
    'Drain the cooked spaghetti and toss it in the tomato sauce.',
    'Serve the classic spaghetti hot, optionally topped with cheese.'
  ],
  isGlutenFree: false,
  isVegan: false,
  isVegetarian: true,
  isLactoseFree: false,
),


  Meal(
    id: 'n4',
    categories: ['c7'],
    title: 'Akara',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://www.myactivekitchen.com/wp-content/uploads/2015/04/akara-image-6.jpg',
    duration: 30,
    ingredients: ['Black-Eyed Peas', 'Onions', 'Spices'],
    steps: [
      'Soak and peel black-eyed peas.',
      'Blend the peas with onions and spices.',
      'Form small balls and deep-fry until golden brown.',
      'Serve the delicious Akara!'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

   Meal(
    id: 'n5',
    categories: ['c8', 'c9'],
    title: 'Moin Moin',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: 'https://sisijemimah.com/wp-content/uploads/2016/01/image.jpeg',
    duration: 60,
    ingredients: ['Grounded Peeled Beans', 'Onions', 'Spices'],
    steps: [
      'Blend peeled beans with onions and spices.',
      'Pour the mixture into containers for steaming.',
      'Steam until firm and fully cooked.',
      'Serve the delicious Moin Moin!'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meal(
    id: 'n6',
    categories: ['c2', 'c3'],
    title: 'Suya',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://img-global.cpcdn.com/recipes/97320177d01375a4/1200x630cq70/photo.jpg',
    duration: 30,
    ingredients: ['Skewered Meat', 'Spices', 'Onions', 'Tomatoes'],
    steps: [
      'Season meat with a special spice blend.',
      'Skewer and grill until fully cooked.',
      'Serve with sliced onions and tomatoes.',
      'Enjoy the flavorful Suya!'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  Meal(
    id: 'n7',
    categories: ['c10', 'c5'],
    title: 'Fried Rice',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: 'https://example.com/fried_rice.jpg',
    duration: 45,
    ingredients: ['Rice', 'Vegetables', 'Protein (Chicken/Shrimp)', 'Spices'],
    steps: [
      'Cook rice until partially done.',
      'Stir-fry vegetables and protein in a wok.',
      'Combine rice with the stir-fried mixture.',
      'Cook until the rice is fully done.',
      'Serve the flavorful Fried Rice!'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  
  

  Meal(
    id: 'n9',
    categories: ['c2', 'c3'],
    title: 'Fried Plantains',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://flawlessfood.co.uk/wp-content/uploads/2023/04/Fried-Plantain-16.jpg',
    duration: 20,
    ingredients: ['Plantains'],
    steps: [
      'Slice plantains and deep-fry until golden brown.',
      'Serve as a side dish or snack.',
      'Enjoy the delicious Fried Plantains!'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meal(
    id: 'n10',
    categories: ['c4', 'c7'],
    title: 'Yam Porridge',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://thetrumpet.ng/wp-content/uploads/2022/08/yam-porridge.jpg',
    duration: 45,
    ingredients: ['Yam', 'Vegetables', 'Fish/Meat', 'Spices'],
    steps: [
      'Cook yam, vegetables, and fish or meat in a flavorful broth.',
      'Simmer until all ingredients are well-cooked.',
      'Serve the hearty Yam Porridge!'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meal(
    id: 'n11',
    categories: ['c8', 'c9'],
    title: 'Puff-Puff',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://www.afrisian.co.uk/cdn/shop/files/PuffPuff_f9927114-912b-4505-813b-0df8649b8587_1080x.png?v=1692889559',
    duration: 30,
    ingredients: ['Flour', 'Sugar', 'Yeast', 'Water', 'Spices'],
    steps: [
      'Mix flour, sugar, yeast, and water to form a batter.',
      'Deep-fry small portions until golden brown.',
      'Serve the sweet and fluffy Puff-Puff!'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),


  ];