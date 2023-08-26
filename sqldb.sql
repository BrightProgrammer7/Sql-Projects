/*==============================================================*/
/* Table : FOURNISSEURS                                         */
/*==============================================================*/
create table FOURNISSEURS 
(
   NUMERO               INTEGER              not null,
   NOM                  CHAR(256),
   ADRESSE              CHAR(256),
   constraint PK_FOURNISSEURS primary key (NUMERO)
);

/*==============================================================*/
/* Table : PRODUITS                                             */
/*==============================================================*/
create table PRODUITS 
(
   CODE                 INTEGER              not null,
   DESIGNATION          CHAR(256),
   PRIX                 INTEGER,
   constraint PK_PRODUITS primary key (CODE)
);

/*==============================================================*/
/* Table : PROVENIR                                             */
/*==============================================================*/
create table PROVENIR 
(
   NUMERO               INTEGER              not null,
   CODE                 INTEGER              not null,
   PRIX_D_ACHAT         INTEGER              not null,
   constraint PK_PROVENIR primary key (NUMERO, CODE)
);

/*==============================================================*/
/* Index : PROVENIR_FK                                          */
/*==============================================================*/
create index PROVENIR_FK on PROVENIR (
   CODE ASC
);

/*==============================================================*/
/* Table : RELATION_2                                           */
/*==============================================================*/
create table RELATION_2 
(
   CODE                 INTEGER              not null,
   NUMERO               INTEGER              not null,
   constraint PK_RELATION_2 primary key (CODE, NUMERO)
);

/*==============================================================*/
/* Index : RELATION_2_FK                                        */
/*==============================================================*/
create index RELATION_2_FK on RELATION_2 (
   NUMERO ASC
);

alter table PROVENIR
   add constraint FK_PROVENIR_PROVENIR_PRODUITS foreign key (CODE)
      references PRODUITS (CODE);

alter table PROVENIR
   add constraint FK_PROVENIR_PROVENIR2_FOURNISS foreign key (NUMERO)
      references FOURNISSEURS (NUMERO);

alter table RELATION_2
   add constraint FK_RELATION_RELATION__FOURNISS foreign key (NUMERO)
      references FOURNISSEURS (NUMERO);

alter table RELATION_2
   add constraint FK_RELATION_RELATION__PRODUITS foreign key (CODE)
      references PRODUITS (CODE);
