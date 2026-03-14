import 'dart:convert'; // Pour convertir les données JSON en objets Dart et vice versa
import 'dart:io'; // Pour gérer les entrées/sorties, notamment les requêtes HTTP
import 'package:http/http.dart' as http; // Pour effectuer des requêtes HTTP (GET, POST, etc.)
Future<void> getProducts(String baseUrl) async {
  final response = await http.get(Uri.parse('$baseUrl/products'));

if (response.statusCode == 200) {
  List<dynamic> products = jsonDecode(response.body);
  print('Produits disponibles:');

  for (var product in products) {
    print('Nom: ${product['Nom']}, Prix: ${product['Prix']}, stock: ${product['stock']}, Categorie: ${product['Categorie']}');
  }

} else {
  print('Erreur lors de la récupération des produits');
}
}

Future<void> addProduct(String baseUrl, Map<String, dynamic> product) async {
  final response = await http.post(
    Uri.parse('$baseUrl/products'),
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: jsonEncode(product),
  );

  if (response.statusCode == 201) {
    print('Produit ajouté avec succès');
  } else {
    print('Erreur lors de l\'ajout du produit');
  }
}

void main() async {
  final String baseUrl = 'http://localhost:3000';

  print('=== Test du client API Dart ===\n');

  // Récupérer tous les produits
  print('1. Récupération des produits:');
  await getProducts(baseUrl);
  print('');
}