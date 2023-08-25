/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  5/22/2023 7:39:55 PM                     */
/*==============================================================*/


/*==============================================================*/
/* Table : APPARTENIR                                           */
/*==============================================================*/
create table APPARTENIR 
(
   NUM_CAT              CHAR(10)             not null,
   NUM_CHAMBRE          CHAR(10)             not null,
   constraint PK_APPARTENIR primary key (NUM_CAT, NUM_CHAMBRE)
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE 
(
   NUM_CAT              CHAR(10)             not null,
   NBRE_LIT             CHAR(10),
   TARIF                CHAR(10),
   constraint PK_CATEGORIE primary key (NUM_CAT)
);

/*==============================================================*/
/* Table : CHAMBRE                                              */
/*==============================================================*/
create table CHAMBRE 
(
   NUM_CHAMBRE          CHAR(10)             not null,
   NUM_TEL              CHAR(10),
   constraint PK_CHAMBRE primary key (NUM_CHAMBRE)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT 
(
   ID_CIENT             CHAR(10)             not null,
   NOM_CLI              CHAR(10),
   PRENOM_CLI           CHAR(10),
   constraint PK_CLIENT primary key (ID_CIENT)
);

/*==============================================================*/
/* Table : COMPRENDRE                                           */
/*==============================================================*/
create table COMPRENDRE 
(
   NUM_RESERVATIO       CHAR(10)             not null,
   ATTRIBUT_26          CHAR(10)             not null,
   constraint PK_COMPRENDRE primary key (NUM_RESERVATIO, ATTRIBUT_26)
);

/*==============================================================*/
/* Table : RESERVER                                             */
/*==============================================================*/
create table RESERVER 
(
   ID_CIENT             CHAR(10)             not null,
   NUM_CHAMBRE          CHAR(10)             not null,
   NUM_RESERVATIO       CHAR(10)             not null,
   constraint PK_RESERVER primary key (ID_CIENT, NUM_CHAMBRE, NUM_RESERVATIO)
);

/*==============================================================*/
/* Table : SALARIE                                              */
/*==============================================================*/
create table SALARIE 
(
   NUM_RESERVATIO       CHAR(10)             not null,
   ID_TYPE_RES          CHAR(10)             not null,
   DATE_RESERVATION     CHAR(10),
   DATE_ARRIVEE         CHAR(10),
   DATE_DEPART          CHAR(10),
   NBRE_NUIT            CHAR(10),
   NBRE_CHAMBRES        CHAR(10),
   constraint PK_SALARIE primary key (NUM_RESERVATIO)
);

/*==============================================================*/
/* Table : SUPPLEMENT                                           */
/*==============================================================*/
create table SUPPLEMENT 
(
   ATTRIBUT_26          CHAR(10)             not null,
   TYPE                 CHAR(10),
   TARIF                CHAR(10),
   constraint PK_SUPPLEMENT primary key (ATTRIBUT_26)
);

/*==============================================================*/
/* Table : TYPE_RESERVATION                                     */
/*==============================================================*/
create table TYPE_RESERVATION 
(
   ID_TYPE_RES          CHAR(10)             not null,
   PENSION              CHAR(10),
   TARIF                CHAR(10),
   constraint PK_TYPE_RESERVATION primary key (ID_TYPE_RES)
);

alter table APPARTENIR
   add constraint FK_APPARTEN_APPARTENI_CHAMBRE foreign key (NUM_CHAMBRE)
      references CHAMBRE (NUM_CHAMBRE);

alter table APPARTENIR
   add constraint FK_APPARTEN_APPARTENI_CATEGORI foreign key (NUM_CAT)
      references CATEGORIE (NUM_CAT);

alter table COMPRENDRE
   add constraint FK_COMPREND_COMPRENDR_SUPPLEME foreign key (ATTRIBUT_26)
      references SUPPLEMENT (ATTRIBUT_26);

alter table COMPRENDRE
   add constraint FK_COMPREND_COMPRENDR_SALARIE foreign key (NUM_RESERVATIO)
      references SALARIE (NUM_RESERVATIO);

alter table RESERVER
   add constraint FK_RESERVER_RESERVER_SALARIE foreign key (NUM_RESERVATIO)
      references SALARIE (NUM_RESERVATIO);

alter table RESERVER
   add constraint FK_RESERVER_RESERVER2_CLIENT foreign key (ID_CIENT)
      references CLIENT (ID_CIENT);

alter table RESERVER
   add constraint FK_RESERVER_RESERVER3_CHAMBRE foreign key (NUM_CHAMBRE)
      references CHAMBRE (NUM_CHAMBRE);

alter table SALARIE
   add constraint FK_SALARIE_REL_1_TYPE_RES foreign key (ID_TYPE_RES)
      references TYPE_RESERVATION (ID_TYPE_RES);

