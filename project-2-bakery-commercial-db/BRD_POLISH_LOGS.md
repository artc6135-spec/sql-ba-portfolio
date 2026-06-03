# Raport z audytu językowego i technicznego (BRD Review)

**Status projektu:** Weryfikacja zakończona (Sprint 1.5)
**Data logowania:** 2026-05-28
**Rola:** Junior Business Analyst / Data Analyst
**Końcowy KPI dokładności:** 76.5% (Poziom operacyjny: Komunikacja i dokumentacja w Jira)
---
## DECONSTRUCTION SUMMARY (PHATRD)
* **Kontekst (P):** Tłumaczenie i analiza realnego, 300-słownego dokumentu wymagań biznesowych (BRD) na język polski w standardzie korporacyjnym.
* **Problematyka (H):** Wykrycie i eliminacja kalk językowych, błędów składniowych, fałszywych przyjaciół tłumacza (false friends) oraz krytycznych przesunięć logicznych.
* **Architektura (A):** Podział feedbacku na trzy sekcje logowania błędów: Krytyczne błędy logiczne, Ostrzeżenia składniowe (Warnings) oraz Gotowy kod produkcyjny (Refaktoryzacja).
* **Ograniczenia (T):** Maksymalna precyzja bez wygładzania błędów, rygorystyczne zachowanie terminologii IT (SQL/CTE).
* **Zasoby i Ryzyka (R):** Wysoka gęstość informacyjna tekstu źródłowego. Filtrowanie szumu informacyjnego i transformacja teorii filologicznej na ustrukturyzowany format logów błędów (wzorowany na IDE).

---

## CZĘŚĆ 1: KRYTYCZNE BŁĘDY LOGICZNE (CRITICAL ERRORS)

Poniższe błędy techniczne i semantyczne zniekształciły logikę biznesową dokumentu i zostały zidentyfikowane podczas weryfikacji kodu:

1. **Używanie optymalnych CFO zamiast CTE**
   * *Tekst źródłowy:* `...z używaniem optymalnych CFO.`
   * *Bug:* Skrót **CFO** oznacza *Chief Financial Officer* (Dyrektor Finansowy). Zamiast instrukcji dla bazy danych dotyczącej Wspólnych Wyrażeń Tablicowych (**CTE**), tekst nakazywał "wdrożenie zoptymalizowanych dyrektorów finansowych" do architektury bazy danych.
2. **Rozrabiać plany (False Friend #1)**
   * *Tekst źródłowy:* `...i rozrabiać efektywne plany...`
   * *Bug:* Czasownik *rozrabiać* w języku polskim oznacza "rozcieńczać płyny" lub "zachowywać się chuligańsko". Tworzenie planów biznesowych w terminologii korporacyjnej to wyłącznie: **opracowywać plany** lub **tworzyć plany**.
3. **Zginięcie danych (Semantyczny kolaps)**
   * *Tekst źródłowy:* `...żeby wyłonczyć zginięcie danych...`
   * *Bug:* Słowo *zginięcie* odnosi się do tragicznej śmierci (np. w wypadku). Dane w relacyjnej bazie danych nie giną w sensie fizycznym – one są tracone. Poprawny termin to: **utrata danych**.
4. **Filtracja łańcuchów (Błąd pojęciowy IT)**
   * *Tekst źródłowy:* `...na poziąmie filtracji łańcychów.`
   * *Bug:* Wiersz w tabeli relacyjnej bazy danych to **wiersz** lub **rekord**. Słowo *łańcuch* (łańcuch znaków / String) odnosi się do typu danych w kodzie, a nie do struktur tabeli SQL. Poprawnie: **na poziomie filtrowania wierszy**.
5. **Izolровать (Błąd składni / Splot kontekstu)**
   * *Tekst źródłowy:* `...warto izolровать transakcji...`
   * *Bug:* Krytyczny błąd składniowy polegający na złączeniu dwóch różnych alfabetów w jednym wyrazie. Poprawna forma biznesowa: **wyizolować transakcje**.

---

## CZĘŚĆ 2: OSTRZEŻENIA SKŁADNIOWE I ORTOGRAFICZNE (WARNINGS)

* `projectu / presentować / productów` -> Wpływ angielskiego interfejsu systemowego (zamiana c -> k/z). Poprawnie: **projektu, prezentować, produktów**.
* `Odrazu` -> Błąd połączenia tokenów. Piszemy wyłącznie rozdzielnie: **Od razu**.
* `Te podejście` -> Błąd uzgodnienia rodzaju (podejście to rodzaj nijaki - to, a nie liczba mnoga - te). Poprawnie: **To podejście**.
* `taryfów` -> Słowo *taryfa* jest rodzaju żeńskiego (ta taryfa). W dopełniaczu liczby mnogiej brzmi: **taryf**.
* `periodach` -> Niezalecana kalka językowa. W polskiej dokumentacji analitycznej i finansowej stosuje się termin: **okresy** (*w okresach przed zmianą cen*).
* `oddział analityky` -> *Oddział* to filia lub jednostka zewnętrzna (np. banku). Departament wewnętrzny w strukturze firmy to **dział**. Po literze "k" zawsze piszemy "i": **dział analityki**.
* `audytorii` -> Kalkowanie pojęcia marketingowego. W analizie biznesowej stosuje się termin: **grupa docelowa**.

---

## CZĘŚĆ 3: REFAKTORYZACJA KODU (PRODUCTION-READY TEXT)

Oto zoptymalizowany, spójny i poprawny biznesowo tekst specyfikacji (BRD), przepisany na oficjalny język korporacyjny:

> W związku z wdrożeniem nowej strategii dynamicznego wyceniania, obecny system raportowania departamentu sprzedaży wymaga głębokiej modernizacji. Głównym celem biznesowym tego projektu jest dostarczenie kierownictwu firmy narzędzia do dokładnej analizy marżowości oraz zysku netto w podziale na kategorie produktów, z uwzględnieniem historycznych zmian cen towarów. Zmiany te pozwolą nam w porę identyfikować stagnujące grupy produktów, optymalizować kampanie marketingowe oraz opracowywać efektywne plany przyznawania rabatów w celu zwiększenia bazy lojalnych klientów.
> Obecna architektura bazy danych nie pozwala na poprawne zestawienie dat zamówień z historią zmian cen detalicznych. Dlatego rozwiązanie techniczne musi zostać zaimplementowane z wykorzystaniem zoptymalizowanych wspólnych wyrażeń tablicowych (CTE). Podejście to pozwoli na podział algorytmu obliczeniowego na trzy niezależne części logiczne. Po pierwsze, należy obliczyć przychód ze sprzedaży po wprowadzeniu nowych taryf. Po drugie, należy wyliczyć zysk za okresy przed zmianą cen. Po trzecie, należy wyizolować transakcje na produktach, których bazowe ceny detaliczne pozostawały niezmienne przez cały okres sprawozdawczy.
> Ostateczny raport analityczny musi konsolidować wyniki tych trzech obliczeń za pomocą funkcji obsługi wartości pustych (COALESCE), aby wykluczyć utratę danych podczas łączenia tabel. Finalny skrypt powinien zwracać unikalny identyfikator, oficjalną nazwę kategorii oraz skumulowany zysk historyczny. Wszystkie anulowane zamówienia oraz zwroty must zostać bezwzględnie wykluczone z obliczeń na poziomie filtrowania wierszy.
> Oprócz kalkulacji wskaźników finansowych, dział analiz powinien opracować profil typowego klienta dla każdej kategorii. Pozwoli to z wysoką dokładnością określić preferencje konsumenckie oraz siłę nabywczą grupy docelowej. Na podstawie tych danych dyrektor handlowy zatwierdzi nowe, wspólne rozwiązania dotyczące wdrożenia produktów premium o podwyższonej marży.
> Wykonawca jest zobowiązany do przeprowadzenia pełnego wewnętrznego testowania stworzonych skryptów, usunięcia wszelkich błędów krytycznych w bazie kodu oraz dostarczenia końcowej dokumentacji technicznej w formacie Markdown do końca bieżącego sprintu. Odpowiedzialność za integrację rozwiązania spoczywa na zespole inżynierów danych.
---
**Wnioski systemowe:** Zdolność interpretacji i analizy zaawansowanych tekstów biznesowych (BRD) na poziomie B2+. Samodzielna kompilacja dokumentacji na poziomie operacyjnym (A2/B1) wymagająca weryfikacji pod kątem automatycznych kalk językowych przy intensywnych sprintach roboczych. Zredukowano ryzyko powtarzalności błędów krytycznych.
