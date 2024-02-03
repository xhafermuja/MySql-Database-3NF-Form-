Create Table Kategori(
kat_id int identity primary key,
kat_emri varchar(100),
kat_pershkrimi varchar(200),
)

Create Table Prodhues(
prodh_id int identity primary key ,
prodh_emri varchar(100),
prodh_pershkrimi varchar(200),
)

Create Table Produkt(
prd_id int identity primary key ,
prd_kat_id int,
prd_prodh_id int ,
prd_statusi varchar(100),

Foreign key (prd_kat_id) References Kategori(kat_id),
Foreign key (prd_prodh_id) References Prodhues(prodh_id)
)

Create Table prd_detaje(
prd_id int,
prd_emri varchar(100),
prd_qmimi int,
prd_pershkrimi varchar(255),
prd_data date,

FOREIGN KEY (prd_id) REFERENCES Produkt(prd_id)
)

Create table Blerja_Mallit(
blerja_id int identity primary key,
blerja_prd_id int,
blerja_qty int ,
blerja_qmimi_hyres int,
blerja_qmimi_dales int,
blerja_data date,
blerja_totali int,

FOREIGN KEY (blerja_prd_id) REFERENCES Produkt(prd_id)
)

Create table Kthimi_Mallit(
kthimi_id int identity primary key,
kthimi_blerja_prd_id int,
kthimi_qty int ,
kthimi_data date,
kthimi_arsyeja varchar(500),

FOREIGN KEY (kthimi_blerja_prd_id) REFERENCES Blerja_Mallit(blerja_id)
)

Create Table Konsumator(
kons_id int identity primary key,
kons_detaje_id int,
kons_emri varchar(50),
kons_email varchar(250),
kons_password varchar(250),
kons_kontakti varchar(100),

Foreign key (kons_detaje_id) References kons_detaje(kons_id)
)

Create Table kons_detaje(
kons_id int identity primary key ,
kons_rruga varchar(250),
kons_qyteti varchar(50),
kons_shteti varchar(50),
kons_zip int,
)

Create Table Porosi(
porosi_id int identity primary key,
porosi_kons_id int,
porosi_data date,
porosi_status varchar(50),

Foreign key (porosi_kons_id) references Konsumator(kons_id)
)

Create Table porosi_detaje(
pd_porosi_id int,
pd_prd_id int,
pd_qty int,
pd_qmimi int,

FOREIGN KEY (pd_porosi_id) REFERENCES Porosi(porosi_id),
FOREIGN KEY (pd_prd_id) REFERENCES Produkt(prd_id)
)

Create table Shitje(
shitje_id int identity primary key,
shitje_porosi_id int,
shitje_pagesa varchar(250),

FOREIGN KEY (shitje_porosi_id) REFERENCES Porosi(porosi_id) 
)

Create table Kthimet_Shitje(
ksh_id int identity primary key,
ksh_shitje_id int ,
ksh_prd_id int,
ksh_qty int,
ksh_data date,
ksh_arsye varchar(500),

FOREIGN KEY (ksh_shitje_id) REFERENCES Shitje(shitje_id),
FOREIGN KEY (ksh_prd_id) REFERENCES Produkt(prd_id)
)