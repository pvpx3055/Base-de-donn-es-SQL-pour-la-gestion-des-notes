-- ============================================================
-- Fichier : GNE.sql
-- Description : Création des tables pour la gestion des notes
-- Auteur : gaoussou ocul
-- Date : 2026-03-24
-- ============================================================

-- 1. FILIERE (aucune dépendance)
CREATE TABLE FILIERE (
    id_filiere   INT           PRIMARY KEY IDENTITY(1,1),
    nom_filiere  VARCHAR(100)  NOT NULL
);

-- 2. NIVEAU (aucune dépendance)
CREATE TABLE NIVEAU (
    id_niveau       INT          PRIMARY KEY IDENTITY(1,1),
    libelle_niveau  VARCHAR(20)  NOT NULL
);

-- 3. ENSEIGNANT (aucune dépendance)
CREATE TABLE ENSEIGNANT (
    id_enseignant  INT           PRIMARY KEY IDENTITY(1,1),
    nom            VARCHAR(100)  NOT NULL,
    prenom         VARCHAR(100)  NOT NULL,
    email          VARCHAR(150)  UNIQUE
);

-- 4. ETUDIANT (dépend de FILIERE et NIVEAU)
CREATE TABLE ETUDIANT (
    id_etudiant     INT           PRIMARY KEY IDENTITY(1,1),
    nom             VARCHAR(100)  NOT NULL,
    prenom          VARCHAR(100)  NOT NULL,
    date_naissance  DATE,
    id_filiere      INT           NOT NULL,
    id_niveau       INT           NOT NULL,
    CONSTRAINT FK_etudiant_filiere FOREIGN KEY (id_filiere) REFERENCES FILIERE(id_filiere),
    CONSTRAINT FK_etudiant_niveau  FOREIGN KEY (id_niveau)  REFERENCES NIVEAU(id_niveau)
);

-- 5. COURS (dépend de ENSEIGNANT)
CREATE TABLE COURS (
    id_cours        INT           PRIMARY KEY IDENTITY(1,1),
    intitule        VARCHAR(150)  NOT NULL,
    coefficient     DECIMAL(4,2)  NOT NULL DEFAULT 1,
    volume_horaire  INT,
    id_enseignant   INT           NOT NULL,
    CONSTRAINT FK_cours_enseignant FOREIGN KEY (id_enseignant) REFERENCES ENSEIGNANT(id_enseignant)
);

-- 6. NOTE (dépend de ETUDIANT et COURS)
CREATE TABLE NOTE (
    id_note         INT            PRIMARY KEY IDENTITY(1,1),
    valeur          DECIMAL(5,2)   NOT NULL,
    date_evaluation DATE           NOT NULL,
    type_eval       VARCHAR(50),
    id_etudiant     INT            NOT NULL,
    id_cours        INT            NOT NULL,
    CONSTRAINT FK_note_etudiant FOREIGN KEY (id_etudiant) REFERENCES ETUDIANT(id_etudiant),
    CONSTRAINT FK_note_cours    FOREIGN KEY (id_cours)    REFERENCES COURS(id_cours),
    CONSTRAINT CHK_note_valeur  CHECK (valeur BETWEEN 0 AND 20)
);
