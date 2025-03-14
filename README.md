[![forthebadge](https://forthebadge.com/images/badges/powered-by-coffee.svg)](https://forthebadge.com)

# Exercice - Faites vos premiers pas avec Symfony

## Contenu:

L’entreprise VéhiLoc, spécialisée dans la location de voiture, fait appel à vous pour mettre à jour son site web. Youssef, le gérant, souhaite faire deux modifications sur le parc de voitures affichées sur le site :

-   ajouter de nouvelles voitures via le formulaire présent sur le site (inactif actuellement) ;
-   supprimer des voitures existantes.

Pour réaliser cette mise à jour, vous allez devoir rendre le site dynamique, en utilisant le framework Symfony

## Technologie:

-   PHP v8.3.14
-   Symfony v5.11.0

## Pour utiliser ce projet :

### Récupérez le projet :

-   Commencer par cloner le projet.
-   installez le projet chez vous, dans un dossier exécuté par un serveur local (type MAMP, WAMP, LAMP, etc...)

### Mettez en place la BDD

-   Une fois installé chez vous, créez un base de données vide appelée : "vehicloc"
-   Importez le fichier vehicloc.sql (dossier "data") dans votre base de données.

### Préparez le fichier config.pgp

-   Créez un fichier .env.local à partir du .env
-   Modifiez le en mettant votre DB_USER et votre DB_PASS à jour à la place de app:!ChangeMe!

### Installez les dépendances PHP

Installez les dépendances PHP avec Composer.
=> composer install

### Lancer le projet

Démarrez le serveur Symfony.
=> symfony serve
Accédez à votre application via http://localhost:8000

### Arrêter le projet

Pour arrêter le serveur Symfony :
=> symfony serve:stop
