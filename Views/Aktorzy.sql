create view Aktorzy
as
select Aktor.*,osoba.imie,osoba.nazwisko
from osoba
join aktor on osoba.osobaid = aktor.osobaid
go