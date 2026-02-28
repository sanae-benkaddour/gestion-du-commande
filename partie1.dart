class StockInsuffisantException implements Exception {
  final String message;
  StockInsuffisantException(this.message);
  
  @override
  String toString() => 'StockInsuffisantException: $message';
}

/**
 * Exception levée lors de l'affichage d'une commande vide
 */
class CommandeVideException implements Exception {
  final String message;
  CommandeVideException(this.message);
  
  @override
  String toString() => 'CommandeVideException: $message';
}


class Produit {
  // Attributs requis
  String nom;
  double prix;
  int stock;
  String categorie;
  
  /**
   * Constructeur avec paramètres nommés obligatoires
   */
  Produit({
    required this.nom,
    required this.prix,
    required this.stock,
    required this.categorie,
  });
  
  //List<Produit> catalogueProduits=[];
  /**
   * Méthode pour afficher les détails du produit
   */
  void afficherDetails() {
    print('Produit: $nom');
    print('Prix: ${prix.toStringAsFixed(2)} DH');
    print('Stock: $stock unités');
    print('Catégorie: $categorie');
    print('---');
  }
}
List<Produit> catalogueProduits=[];
class ProduitCommande {
  Produit produit;
  int quantite;
  
  ProduitCommande(this.produit, this.quantite);
}
 
Produit? RechercherProduitParNom(String nom) {
  try {
    return catalogueProduits.firstWhere(
      (produit) => produit.nom.toLowerCase() == nom.toLowerCase()
    );
  } catch (e) {
    return null; // Produit non trouvé
  }
}
void afficherTousLesProduits() {
  print('=== CATALOGUE DES PRODUITS ===');
  
  catalogueProduits.forEach((produit) => produit.afficherDetails());
   }
void main() {  
    catalogueProduits.addAll([
      Produit(nom: 'iPhone 15', prix: 8000.0, stock: 5, categorie: 'Phone'),
      Produit(nom: 'Samsung Galaxy', prix: 6500.0, stock: 3, categorie: 'Phone'),
      Produit(nom: 'MacBook Pro', prix: 15000.0, stock: 2, categorie: 'Laptop'),
      Produit(nom: 'Souris', prix: 25.0, stock: 10, categorie: 'Accessoire'),
      Produit(nom: 'Clavier', prix: 75.0, stock: 8, categorie: 'Accessoire'),
    ]);
    
    print('✅ Produits créés avec succès');
    afficherTousLesProduits;
    
  }