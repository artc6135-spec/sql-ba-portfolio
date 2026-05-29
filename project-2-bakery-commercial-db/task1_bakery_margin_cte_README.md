Zadanie: Analiza marżowości kategorii (Architektura CTE)
Cel biznesowy:
Analiza zysku netto dla wszystkich kategorii towarów pod kątem ich dochodowości w ujęciu historycznym.
Pozwoli to zrozumieć, które kategorie są słabiej rozwinięte w porównaniu do innych oraz umożliwi stworzenie planu ich wzmocnienia.
Biorąc pod uwagę kategorie o największym zysku, można opracować plan zwiększenia bazy klientów za pomocą działań reklamowych i/lub rabatów,
bądź wdrożyć nowy towar o wyższej cenie i marżowości. Warto także stworzyć profil typowego klienta oraz określić jego preferencje w ujęciu poszczególnych kategorii.

Opis logiki:
Zapytanie zwraca nazwę kategorii oraz zysk tej kategorii w ujęciu historycznym. Zapytanie SQL zostało podzielone na logiczne części. 
Pierwsze trzy części to wspólne wyrażenia tablicowe (CTE), które obliczają zysk w trzech różnych przypadkach:
1. New_orders – oblicza zysk ze sprzedaży towarów po wdrożeniu nowej ceny, bazując na dacie zamówienia i historii cen.
2. Old_orders – oblicza zysk ze sprzedaży towarów przed zmianą ceny, sugerując się datą zamówienia.
3. Orders_without_changes – oblicza zysk dla towarów, które nigdy nie miały zmienianej ceny detalicznej.

Główny SELECT łączy wyniki tych wyrażeń za pomocą funkcji COALESCE, sumuje całkowity zysk i zwraca nazwy kategorii wraz z ich zyskiem ogólnym.
