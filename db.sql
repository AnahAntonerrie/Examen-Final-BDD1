Create database gestion_de_supermarché

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE produits(
    id int primary key,
    nom_produit varchar(100) NOT NULL,
    description text,
    prix_vente float,
    quantite_stock int,
    date_expiration date,
    id_categories int references categories(id),
    id_fournisseurs int references fournisseurs(id)
);

CREATE TABLE fournisseurs(
    id int primary key,
    nom_fournisseur varchar(50) NOT NULL,
    contact varchar(50),
    adresse varchar(100),
    email varchar(100)
);

CREATE TABLE clients (
    id SERIAL primary key,
    payement check(payement in('espece', 'carte_bancaire', 'mobile_money')) NOT NULL,
    nom varchar(250) NOT NULL,
    contact varchar(250) NOT NULL,
    email varchar(250) NOT NULL,
    adresse varchar(250) NOT NULL
);

CREATE TABLE employe (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(250) NOT NULL,
    prenom varchar(250) NOT NULL,
    poste VARCHAR(50)NOT NULL
);

CREATE TABLE ventes(
    id SERIAL primary key,
    date_vente datetime NOT NULL,
    total float NOT NULL,
    id_client int references clients(id),
    id_employe int references employe(id)
);

CREATE TABLE details_ventes(
    id SERIAL primary key,
    quantite int NOT NULL,
    sous_total float NOT NULL,
    id_vente int references ventes(id),
    id_produit int references produits(id)

);
CREATE TABLE achats (
    id SERIAL primary key,
    date_achat datetime NOT NULL,
    total float NOT NULL,
    id_fournisseur int references fournisseurs(id)
);
CREATE TABLE detail_achats(
    id SERIAL primary key,
    prix_unitaire float NOT NULL,
    id_achat int references achats(id),
    id_produit int references produits(id),
);
CREATE TABLE payement(
    id SERIAL primary key,
    mode varchar(200) check(mode in ('carte_bancaire' , 'mobile_money')) NOT NULL,
    id_client int references clients(id)
);
CREATE TABLE concerner(
    id_produit int references produits(id),
    id_details_vente int references details_ventes(id)
);
CREATE TABLE correspondre(
    id_produit int references produits(id),
    id_details_achats int references detail_achats(id)
)