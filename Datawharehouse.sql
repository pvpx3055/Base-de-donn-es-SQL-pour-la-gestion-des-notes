Create Database Datawharehouse;
Go 
use Datawharehouse;

create table DimDate
(
	Date_id int primary key identity (1,1) not null,
	Date date not null,
	Month int not null,
	Year int not null,
);
create table DimCours
(
	id_cours_dim int primary key identity (1,1) not null,
	code_cours int null,
	intitule varchar(150) null,
	coefficient decimal(4, 2) null,
	volume_horaire int null,
	id_enseignant_dim int null
	constraint fk_enseignant_dim foreign key (id_enseignant_dim) references DimEnseignant(id_enseignant_dim)
);
create table DimEnseignant
(
	id_enseignant_dim int primary key identity (1,1) not null,
	nom varchar(100) null,
	prenom varchar(100) null,
	email varchar(150) null
);
create table DimEtudiant
(	id_etudiant_dim int primary key identity (1,1) not null,
	code_etudiant int null,
	nom varchar(100) null,
	prenom varchar(100) null,
	date_naissance date null,
	id_filiere_dim int null,
	id_niveau_dim int null,
	constraint fk_filiere_dim foreign key (id_filiere_dim) references Dimfiliere(id_filiere_dim),
	constraint fk_niveau_dim foreign key (id_niveau_dim) references Dimniveau(id_niveau_dim)
);
create table Dimfiliere
(
	id_filiere_dim int primary key identity (1,1) not null,
	code_filiere int null,
	intitule varchar(150) null
);
create table Dimniveau
(
	id_niveau_dim int primary key identity (1,1) not null,
	code_niveau int null,
	intitule varchar(150) null
);
create table dimnote
(
	id_note_dim int primary key identity (1,1) not null,
	id_etudiant_dim int null,
	id_cours_dim int null,
	type_note varchar(50) null,
	note decimal(4, 2) null,
	id_date_dim int null
);
create table factnotes
(
	id_fact_note int primary key identity (1,1) not null,
	id_etudiant_dim int null,
	id_cours_dim int null,
	type_note varchar(50) null,
	note decimal(4, 2) null,
	id_date_dim int null
	id_filiere_dim int ,
	id_niveau_dim int null



);

