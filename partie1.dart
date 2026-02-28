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

class ProduitCommande {
  Produit produit;
  int quantite;
  
  ProduitCommande(this.produit, this.quantite);
}
 

void main() {  
    Produit iphone = Produit(
      nom: 'iPhone 15',
      prix: 8000.0,
      stock: 5,
      categorie: 'Phone'
    );
    
    Produit souris = Produit(
      nom: 'Souris Gaming',
      prix: 150.0,
      stock: 10,
      categorie: 'Accessoire'
    );
    
    Produit imprimante = Produit(
      nom: 'imprimante thermique',
      prix: 2900.0,
      stock: 8,
      categorie: 'imprimante'
    );
    
    print('✅ Produits créés avec succès');
    iphone.afficherDetails();
    souris.afficherDetails();
    imprimante.afficherDetails();
    
  }