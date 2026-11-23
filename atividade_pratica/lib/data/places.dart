import 'package:flutter/material.dart';

class Place {
  final String name;
  final String category;
  final String address;
  final String hours;
  final double rating;
  final String description;
  final double lat;
  final double lng;

  const Place({
    required this.name,
    required this.category,
    required this.address,
    required this.hours,
    required this.rating,
    required this.description,
    required this.lat,
    required this.lng,
  });
}

class Category {
  final String title;
  final IconData icon;
  final List<Place> places;

  final bool highlighted;

  const Category({
    required this.title,
    required this.icon,
    required this.places,
    this.highlighted = false,
  });

  String get subtitle =>
      places.length == 1 ? '1 Place' : '${places.length} Places';
}

const _barsAndHotels = [
  Place(
    name: 'Rede Andrade Luxor Hotel',
    category: 'Bars & Hotels',
    address: 'Centro, Teresina-PI',
    hours: '24 horas',
    rating: 4.1,
    description: 'Hotel tradicional do Centro (antigo Luxor Piauí Hotel).',
    lat: -5.0899735,
    lng: -42.8168201,
  ),
  Place(
    name: 'Metropolitan Hotel',
    category: 'Bars & Hotels',
    address: 'Av. Frei Serafim, Centro',
    hours: '24 horas',
    rating: 4.3,
    description: 'Hotel com bar e restaurante na avenida principal.',
    lat: -5.0900,
    lng: -42.8094,
  ),
];

const _fineDining = [
  Place(
    name: 'RB Restaurante',
    category: 'Fine Dining',
    address: 'Centro, Teresina-PI',
    hours: '11h às 15h',
    rating: 4.5,
    description: 'Restaurante no Centro, com pratos regionais e executivos.',
    lat: -5.0896651,
    lng: -42.8139837,
  ),
  Place(
    name: 'Pernambuco Dream',
    category: 'Fine Dining',
    address: 'Teresina-PI',
    hours: '11h às 23h',
    rating: 4.4,
    description: 'Restaurante com cardápio variado e ambiente climatizado.',
    lat: -5.0811240,
    lng: -42.8153913,
  ),
  Place(
    name: 'Casa 7 Marquês',
    category: 'Fine Dining',
    address: 'Teresina-PI',
    hours: '18h às 00h',
    rating: 4.6,
    description: 'Casa de gastronomia e drinks para jantar.',
    lat: -5.0764647,
    lng: -42.8123964,
  ),
];

const _cafes = [
  Place(
    name: 'Oca Cafeteria',
    category: 'Cafes',
    address: 'Centro, Teresina-PI',
    hours: '08h às 19h',
    rating: 4.6,
    description: 'Cafeteria com cafés especiais, bolos e salgados.',
    lat: -5.0846002,
    lng: -42.8145922,
  ),
  Place(
    name: 'Clean Café',
    category: 'Cafes',
    address: 'Centro, Teresina-PI',
    hours: '07h às 18h',
    rating: 4.4,
    description: 'Café, lanches leves e opções saudáveis.',
    lat: -5.0898590,
    lng: -42.8140114,
  ),
];

const _nearby = [
  Place(
    name: 'MIS - Museu da Imagem e do Som de Teresina',
    category: 'Nearby',
    address: 'Centro, Teresina-PI',
    hours: '08h às 17h',
    rating: 4.5,
    description: 'Acervo de fotografias, filmes e músicas sobre a cidade.',
    lat: -5.0896288,
    lng: -42.8154168,
  ),
  Place(
    name: 'Centro Cultural Clube dos Diários',
    category: 'Nearby',
    address: 'Praça Pedro II, Centro',
    hours: 'Conforme programação',
    rating: 4.6,
    description: 'Casarão histórico com exposições e eventos culturais.',
    lat: -5.0909134,
    lng: -42.8135937,
  ),
  Place(
    name: 'Theatro 4 de Setembro',
    category: 'Nearby',
    address: 'Praça Pedro II, Centro',
    hours: 'Conforme programação',
    rating: 4.8,
    description: 'Teatro centenário, símbolo cultural de Teresina.',
    lat: -5.0912848,
    lng: -42.8133243,
  ),
  Place(
    name: 'Central de Artesanato Mestre Dezinho',
    category: 'Nearby',
    address: 'Praça Pedro II, Centro',
    hours: '08h às 18h',
    rating: 4.6,
    description: 'Artesanato piauiense em madeira, couro, cerâmica e opala.',
    lat: -5.0923011,
    lng: -42.8126976,
  ),
  Place(
    name: 'Paróquia de São Benedito',
    category: 'Nearby',
    address: 'Av. Frei Serafim, Centro',
    hours: '07h às 19h',
    rating: 4.7,
    description: 'Igreja histórica no alto da Av. Frei Serafim.',
    lat: -5.0902714,
    lng: -42.8108824,
  ),
];

const _fastFoods = [
  Place(
    name: 'Burger King',
    category: 'Fast Foods',
    address: 'Av. Frei Serafim, Teresina-PI',
    hours: '11h às 23h',
    rating: 4.2,
    description: 'Hambúrgueres grelhados no fogo, batatas e milk-shakes.',
    lat: -5.0846786,
    lng: -42.7984242,
  ),
  Place(
    name: "McDonald's",
    category: 'Fast Foods',
    address: 'Av. Frei Serafim, Teresina-PI',
    hours: '10h às 23h',
    rating: 4.1,
    description: 'Hambúrgueres, batatas fritas e sobremesas.',
    lat: -5.0853019,
    lng: -42.7996898,
  ),
  Place(
    name: 'Subway Frei Serafim',
    category: 'Fast Foods',
    address: 'Av. Frei Serafim, Teresina-PI',
    hours: '10h às 22h',
    rating: 4.3,
    description: 'Sanduíches montados na hora, do seu jeito.',
    lat: -5.0864637,
    lng: -42.8035607,
  ),
];

const _featuredFoods = [
  Place(
    name: 'Hiper Suco',
    category: 'Featured Foods',
    address: 'Centro, Teresina-PI',
    hours: '07h às 19h',
    rating: 4.5,
    description: 'Sucos de frutas regionais, vitaminas e lanches.',
    lat: -5.0925057,
    lng: -42.8116089,
  ),
  Place(
    name: 'Kina Kana',
    category: 'Featured Foods',
    address: 'Centro, Teresina-PI',
    hours: '08h às 18h',
    rating: 4.4,
    description: 'Caldo de cana, pastéis e salgados.',
    lat: -5.0883565,
    lng: -42.8160827,
  ),
];

const List<Category> categories = [
  Category(
    title: 'Bars & Hotels',
    icon: Icons.local_bar_outlined,
    places: _barsAndHotels,
  ),
  Category(
    title: 'Fine Dining',
    icon: Icons.room_service_outlined,
    places: _fineDining,
  ),
  Category(title: 'Cafes', icon: Icons.storefront_outlined, places: _cafes),
  Category(
    title: 'Nearby',
    icon: Icons.location_on_outlined,
    places: _nearby,
    highlighted: true,
  ),
  Category(
    title: 'Fast Foods',
    icon: Icons.fastfood_outlined,
    places: _fastFoods,
  ),
  Category(
    title: 'Featured Foods',
    icon: Icons.bakery_dining_outlined,
    places: _featuredFoods,
  ),
];
