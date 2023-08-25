/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  5/22/2023 9:47:54 PM                     */
/*==============================================================*/


/*==============================================================*/
/* Table : ABONNE                                               */
/*==============================================================*/
create table ABONNE 
(
   NUMABO               CHAR(10)             not null,
   NUMEX                CHAR(10)             not null,
   NOM                  CHAR(10),
   PRENOM               CHAR(10),
   RUE                  CHAR(10),
   VILLE                CHAR(10),
   CODEPOSTAL           CHAR(10),
   TELEPHONE            CHAR(10),
   SALNUM               INTEGER              not null,
   CLINUM               INTEGER              not null
);

alter table ABONNE
   add constraint PK_ABONNE primary key (NUMABO);

/*==============================================================*/
/* Table : AUTEURS                                              */
/*==============================================================*/
create table AUTEURS 
(
   IDAUTEUR             CHAR(10)             not null,
   NOM                  CHAR(10),
   PRENOM               CHAR(10)
);

alter table AUTEURS
   add constraint PK_AUTEURS primary key (IDAUTEUR);

/*==============================================================*/
/* Table : ECRITURELIVRE                                        */
/*==============================================================*/
create table ECRITURELIVRE 
(
   IDAUTEUR             CHAR(10)             not null,
   CODELIVRE            CHAR(10)             not null,
   ID_TYPE_RES          INTEGER              not null,
   SALNUM               INTEGER              not null,
   MATNUM               INTEGER              not null
);

alter table ECRITURELIVRE
   add constraint PK_ECRITURELIVRE primary key (IDAUTEUR, CODELIVRE, ID_TYPE_RES);

/*==============================================================*/
/* Table : LIVRE                                                */
/*==============================================================*/
create table LIVRE 
(
   CODELIVRE            CHAR(10)             not null,
   TITRE                CHAR(10),
   EDITEUR              CHAR(10),
   THEME                CHAR(10),
   COLLECTION           CHAR(10)
);

alter table LIVRE
   add constraint PK_LIVRE primary key (CODELIVRE);

/*==============================================================*/
/* Table : PERSONNEL                                            */
/*==============================================================*/
create table PERSONNEL 
(
   NUMEMP               CHAR(10)             not null,
   NOM                  CHAR(10),
   PRENOM               CHAR(10),
   ADRESSE              CHAR(10),
   FONCTION             CHAR(10),
   SALAIRE              CHAR(10)
);

alter table PERSONNEL
   add constraint PK_PERSONNEL primary key (NUMEMP);

/*==============================================================*/
/* Table : PRET                                                 */
/*==============================================================*/
create table PRET 
(
   IDPRET               CHAR(10)             not null,
   NUMEX                CHAR(10)             not null,
   NUMABO               CHAR(10)             not null,
   CODELIVRE            CHAR(10)             not null,
   DATEPRET             CHAR(10),
   DATERETOUR           CHAR(10),
   SAL_NUMEX            CHAR(10)             not null
);

alter table PRET
   add constraint PK_PRET primary key (IDPRET);

/*==============================================================*/
/* Table : SALARIE                                              */
/*==============================================================*/
create table SALARIE 
(
   NUMEX                CHAR(10)             not null,
   CODELIVRE            CHAR(10)             not null,
   DATEACHAT            CHAR(10),
   ETAT                 CHAR(10),
   DIVNUM               INTEGER              not null
);

alter table SALARIE
   add constraint PK_SALARIE primary key (NUMEX);

alter table ECRITURELIVRE
   add constraint FK_ECRITURE_ECRITUREL_LIVRE foreign key (CODELIVRE)
      references LIVRE (CODELIVRE);

alter table ECRITURELIVRE
   add constraint FK_ECRITURE_ECRITUREL_AUTEURS foreign key (IDAUTEUR)
      references AUTEURS (IDAUTEUR);

alter table PRET
   add constraint FK_PRET_EMPREINTE_ABONNE foreign key (NUMEX)
      references ABONNE (NUMEX);

alter table PRET
   add constraint FK_PRET_EMPRINTER_LIVRE foreign key (CODELIVRE)
      references LIVRE (CODELIVRE);

alter table PRET
   add constraint FK_PRET_ETRE_SALARIE foreign key (NUMEX)
      references SALARIE (NUMEX);

alter table SALARIE
   add constraint FK_SALARIE_APPARTENI_LIVRE foreign key (CODELIVRE)
      references LIVRE (CODELIVRE);

