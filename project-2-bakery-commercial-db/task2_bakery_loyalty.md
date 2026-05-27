1. Cel Biznesowy
Dział marketingu: musi wiedzieć, w jakich miastach znajdują się klienci z poziomem lojalności powyżej 'Silver' w celu analizy skutecznych metod reklamy i planu zwiększenia sprzedaży.
Dział logistyki i magazynu: potrzebuje listy miast, w których popyt na produkty jest większy niż oczekiwano. Pozwoli to na analizę efektywności dostaw, ocenę maksymalnej liczby nowych klientów, których system może obsłużyć natychmiastowo, oraz opracowanie planu wzmocnienia linii dostaw.

2. Kryteria Techniczne (SQL)
Wynik zawiera listę miast i liczbę zamówień spełniających warunki:
* Poziom lojalności: `Silver`, `Gold`, `Platinum`
* Status zamówienia: `Delivered`
* Wolumen: `COUNT(order_id) > 2`
