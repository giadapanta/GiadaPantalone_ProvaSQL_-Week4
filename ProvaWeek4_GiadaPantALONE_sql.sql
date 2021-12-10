--create database Prova4
--creazione delle tabelle
--tabella BAND
create table Band (
idBand int not null identity(1,1) primary key,
Nome varchar(30) not null,
NumeroDiComponenti int not null);

--tabella BRANO
create table Brano(
idBrano int not null identity(1,1) primary key,
TitoloBrano varchar(50) not null, 
Durata int check(Durata>0)
);

--tabella ALBUM
create table Album(
idAlbum int not null identity(1,1) primary key,
TitoloAlbum varchar(50) not null,
AnnoDiUscita int not null,
CasaDiscografica varchar(30) not null,
Genere varchar(30) not null,
SupportoDistribuzione varchar(30) not null,
idBand int not null foreign key references Band(idBand),
constraint Chk_Genere check (Genere='Classico' or Genere='Jazz' or Genere= 'Pop' or Genere='Rock' or Genere= 'Metal'),
constraint Chk_Supporto check(SupportoDistribuzione='CD' or SupportoDistribuzione ='Vinile' or SupportoDistribuzione='Streaming'),
constraint U_Album unique(TitoloAlbum,AnnoDiUscita,CasaDiscografica,Genere,SupportoDistribuzione)
);
--tabella ALBUMBRANO
create table AlbumBrano(
idAlbum int not null,
idBrano int not null,
constraint PK_ALBUMBRANO primary key (idAlbum, idBrano),
constraint FK_idalbum foreign key (idAlbum) references Album(idAlbum),
constraint FK_idbrano foreign key (idBrano) references Brano(idBrano)
);

--Esercitazione.
--1. Scrivere una query che restituisca i titoli degli album degli “883” -- in ordine alfabetico;		
		-- inserisco le band: 883, Maneskin, The Giornalisti 
insert into Band values('883', 2),
					   ('Maneskin', 4),
					   ('The Giornalisti',3);
					   select *
					   from Band
					 --  delete from Band where idBand=6;
		--inserisco degli Album
insert into Album values('Hanno ucciso l''uomo ragno', 1992, 'Fri Records', 'Pop', 'CD',1),
						('Raccolta: Mille Grazie', 2000, 'Warner', 'Pop', 'CD',1);

select * 
from Album a
where a.idBand=1
order by a.TitoloAlbum

--2. Selezionare tutti gli album della casa discografica “Sony Music” 
--   relativi all’anno 2020;
insert into Album values('Il teatro del''ira Vol.1', 2021, 'Sony Music', 'Rock', 'CD', 2),
					    ('Il teatro del''ira Vol.1', 2021, 'Sony Music', 'Rock', 'Streaming', 2),
						('Il ballo della vita', 2018, 'Sony Music','Pop','CD',2);
insert into Band values('Pinguini Tattici Nucleari', 4);
insert into Album values('EP: Ahia!', 2020, 'Sony Music', 'Rock', 'Streaming', 4);

select *
from Album a 
where CasaDiscografica='Sony Music' and AnnoDiUscita=2020;

--3.Scrivere una query che restituisca tutti i titoli delle canzoni 
-- dei “Maneskin” appartenenti ad album pubblicati prima del 2019;insert into Brano values('New Song',210),
						('Torna a casa',241),
						('L''altra dimensione',126),
						('Le parole lontane',204),
						('Lasciami stare',169)
				
insert into AlbumBrano values(5,1),
							(5,2),
							(5,3),
							(5,4),
							(5,5)
							
select b.TitoloBrano
from Brano b join AlbumBrano ab on b.idBrano=ab.idBrano
			join Album a on a.idAlbum=ab.idAlbum
			join Band ba on ba.idBand=a.idBand
where ba.Nome= 'Maneskin' and a.AnnoDiUscita<2019

select *
from Album
select*
from Brano
select *
from Band
select *
from AlbumBrano

--select b.TitoloBrano
--from Album a, Brano b, Band ba
--where ba.Nome='Maneskin' and a.AnnoDiUscita <2019;
select * 
from Brano
--delete from Brano where idBrano=6;
--delete from Brano where idBrano=7;
--delete from Brano where idBrano=8;
--delete from Brano where idBrano=9;
--delete from Brano where idBrano=10;

-- 4. Individuare tutti gli album in cui è contenuta la canzone “Imagine”

insert into Band values('Beatles', 4);
insert into Album values('Imagine Album', 1971, 'Apple-EMI', 'Rock', 'CD', 5)

insert into Brano values('Imagine',180),
						('Crippled Inside',230),
						('It''s so hard',255)
select *
from Album 

insert into AlbumBrano values(8,11),
							(8,12),
							(8,13)

select *
from Brano
--delete from Brano where idBrano=14;
--delete from Brano where idBrano=15;
--delete from Brano where idBrano=16;
select *
from Album a join AlbumBrano ab on a.idAlbum=ab.idAlbum
			join Brano b on b.idBrano=ab.idBrano
where b.TitoloBrano = 'Imagine'

--5. Restituire il numero totale di canzoni eseguite dalla
--    band “The Giornalisti”;
insert into Album values ('Love', 2018, 'Carosello', 'Pop', 'CD', 3);
insert into Brano values('Overture', 84),
						('New York', 219)
insert into AlbumBrano values (9,17),
							(9,18)

select b.TitoloBrano, count(b.idBrano)
from Album a join AlbumBrano ab on a.idAlbum=ab.idAlbum
			join Brano b on b.idBrano=ab.idBrano
			join Band ba on ba.idBand=a.idBand
where ba.Nome= 'The Giornalisti'
group by b.TitoloBrano

--6) Contare per ogni album, la “durata totale” cioè la somma 
--   dei secondi dei suoi brani

--select a.TitoloAlbum, sum(b.Durata) as 'Durata totale'
--from Album a join AlbumBrano ab on a.idAlbum=ab.idAlbum
--			join Brano b on b.idBrano=ab.idAlbum
--group by a.TitoloAlbum


--DOMANDE TEORICHE
--1B, 3B,4A,5A, 2 --> si crea un'altra tabella con le keys delle altre 2 tabelle


select *
from Album
select*
from Brano
select *
from Band
select *
from AlbumBrano
--delete from AlbumBrano where idAlbum=4
--delete from AlbumBrano where idAlbum=3