# Analiza wymagań biznesowych (Streamify) oraz wyciągnięte wnioski

---

### Słowo wstępne od autora
> **Informacja dla rekrutera**  
> Ten dokument biznesowy napisałem **całkowicie samodzielnie, od zera i bez pomocy translatorów czy gotowych szablonów AI**. Jest to moje **pierwsze w życiu autorskie BRD przygotowane w języku polskim**.
> 
> Świadomie zdecydowałem się opublikować ten plik w wersji dwuczęściowej. W drugiej sekcji zebrałem i opisałem wszystkie swoje własne błędy językowe oraz logiczne, które popełniłem w pierwszej wersji roboczej. Chcę w ten sposób pokazać nie tylko finalny efekt mojej pracy, ale przede wszystkim to, jak analizuję informacje, wyciągam wnioski z feedbacku i rozwijam swoje umiejętności zawodowe w polskojęzycznym zespole IT.

---

## 1. DOKUMENT WYMAGAŃ BIZNESOWYCH (BRD) — WERSJA FINALNA

### Cel biznesowy i wskaźniki KPI
* **Problem biznesowy:** Obecna architektura raportowania opiera się na przestarzałych technologiach. Skutkuje to niską wydajnością bazy danych, długim czasem wdrożenia nowych osób do zespołu oraz zbyt wolną reakcją biznesu na dynamiczne zmiany rynkowe.
* **Cel główny:** Zaprojektowanie i wdrożenie nowoczesnej struktury relacyjnej bazy danych (MySQL 8.0+) w celu automatyzacji obliczeń wskaźników retencji (Retention Rate).
* **Kryteria sukcesu:**
  * Poprawna implementacja modelu danych w trzeciej postaci normalnej (3NF).
  * Przygotowanie pełnej dokumentacji technicznej (TDD).
  * Stabilne działanie skryptów analitycznych i brak błędów w bazie.
  * Czas realizacji: maksymalnie 30 dni od momentu zatwierdzenia tego dokumentu.

### Zakres projektu (Project Scope)
* **Wchodzi w zakres:**
  * Stworzenie architektury bazy danych wspierającej analizę kohortową.
  * Implementacja reguł biznesowych dla całego cyklu życia subskrypcji.
  * Rejestracja faktów płatności, odnowień, anulowań oraz zwrotów środków (Refund).
  * **Analiza kohortowa użytkowników w ujęciu historycznym (baza pod wyliczanie Retention Rate).**
* **Poza zakresem:**
  * Implementacja zewnętrznych systemów płatności (Stripe/PayU).
  * Integracja bazy danych z warstwą wizualną strony internetowej.
  * Konfiguracja serwera SMTP do wysyłki e-maili systemowych.
  * Projektowanie interfejsu użytkownika (UX/UI Design).

### Słownik pojęć
* **Streamify / Serwis:** Platforma streamingowa, dla której projektowany jest system.
* **Użytkownik (User):** Zarejestrowana osoba w serwisie posiadająca unikalny identyfikator i własne saldo.
* **Subskrypcja (Subscription):** Umowa na czas określony, dająca użytkownikowi dostęp do zawartości platformy.
* **Okres próbny (Trial):** Darmowy, 14-dniowy dostęp do serwisu aktywowany przy rejestracji.
* **Zwrot środków (Refund):** Zwrócenie środków finansowych na saldo użytkownika zgodnie z polityką firmy.
* **Saldo (Balance):** Ilość wolnych środków finansowych na koncie użytkownika.

### Reguły biznesowe i cykl życia subskrypcji
* **Statusy subskrypcji:** Subskrypcja może być Aktywna (Active), Zakończona (Expired), na Okresie próbnym (Trial) lub Odwołana (Cancelled).
* **Zasada anulowania:** Po rezygnacji z subskrypcji, użytkownik zachowuje dostęp do serwisu do końca opłaconego okresu. Środki za bieżący okres nie są zwracane.
* **Płatności:** Zasilenie konta zwiększa wewnętrzne saldo użytkownika. Każda operacja finansowa generuje automatyczny i nieusuwalny ślad w logach transakcyjnych (billing_log).
* **Automatyczne odnowienie:** Po zakończeniu ważności pakietu system automatycznie pobiera opłatę na kolejny okres z salda użytkownika. W przypadku braku środków, subskrypcja zmienia status na Expired.

### Kryteria akceptacji
* System musi pozwalać na grupowanie użytkowników w kohorty miesięczne w ujęciu historycznym.
* Architektura bazy danych całkowicie uniemożliwia modyfikację lub usuwanie historycznych wpisów o płatnościach.

---

## 2. REWIZJA I POPRAWA MOICH BŁĘDÓW (WNIOSKI)

Podczas pracy nad pierwszą wersją roboczą popełniłem kilka błędów, które dokładnie przeanalizowałem i poprawiłem w ostatecznej wersji tekstu. Poniżej opisuję, co wymagało poprawy:

### Błędy językowe i terminologiczne
1. **Mylenie terminów technicznych (CFO vs CTE)**
   * *Mój błąd:** W roboczych notatkach napisałem o używaniu zoptymalizowanych struktur CFO.
   * *Korekta:* Pomyliłem skróty. CFO to dyrektor finansowy (Chief Financial Officer). Do bazy danych potrzebowałem oczywiście Wspólnych Wyrażeń Tablicowych, czyli CTE (Common Table Expressions). 

2. **Dosłowne tłumaczenia (Kalki językowe)**
   * *Mój błąd:* Użyłem sformułowania produktywhośc roboty bazy danych oraz w robocie systemu.
   * *Korekta:* To kalka językowa. W polskim języku biznesowym i technicznym mówi się o **wydajności bazy danych** oraz o **działaniu lub funkcjonowaniu systemu**.
   * *Mój błąd:* Napisałem wiedze starych technologii oraz w periodach.
   * *Korekta:* Naturalnie brzmi **znajomość technologii** oraz **w okresach** (np. przed zmianą cen). Zamiast oddział analityky powinno być **dział analityki** (oddział to np. filia banku).

3. **Mieszanie języków i pisownia**
   * *Mój błąd:* Słowa takie jak Technikal czy Serwice napisałem jako hybrydy angielsko-polskie.
   * *Korekta:* W dokumentacji zostawiłem czyste, angielskie nazwy własne: **Technical Design Document** oraz **Service**.
   * *Mój błąd:* Pojawiły się błędy w pisowni słów z polskimi znakami nosowymi, np. błendów, czeńściowa, łonczenie.
   * *Korekta:* Poprawiłem pisownię na: **błędów**, **częściowa**, **łączenie**.
