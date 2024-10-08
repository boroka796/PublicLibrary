# SQL-Datenbankprojekt für eine Online-Bücher-Austausch-App
SQL Projekt Data-Mart-Erstellung

Dieses Projekt implementiert eine relationale Datenbank als Grundlage für eine Bücher-Austausch-App. Die Datenbank wurde mit dem Ziel erstellt, eine dynamische Bibliothek zu schaffen, die auf dem Ausleihen von Büchern basiert. Sie verwaltet Benutzerdaten, Buchdaten und Verleihinformationen. Zudem bietet die Datenbank Funktionen zur Verwaltung von Buchverfügbarkeiten und Informationen über den gesamten Verwaltungsprozess (z.B. Ausleihen, Wartelisten, Bewertungen usw.). Außerdem werden Testfälle bereitgestellt, um die Funktionalität der Datenbank zu überprüfen – einschließlich Tests pro Tabelle sowie negativer Tests.

## Inhaltsverzeichnis

1. [Projektbeschreibung](#projektbeschreibung)
2. [Datenbankstruktur](#datenbankstruktur)
3. [Installation](#installation)
4. [Verwendung](#verwendung)
5. [Tests](#tests)
6. [Projektstruktur](#projektstruktur)
7. [Autoren](#autoren)

## Projektbeschreibung

Die Datenbank dient der Verwaltung einer Community-Bibliothek, in der Benutzer Bücher anbieten, ausleihen und bewerten können. Die Hauptziele dieses Projekts sind:

- Verwaltung von Benutzerdaten und Adressen.
- Verwaltung von Büchern, deren Zustand und Verfügbarkeit.
- Verwaltung von Ausleihen und Rückgaben.
- Implementierung eines Bewertungssystems für Bücher und Benutzer.
- Implementierung einer digitalen Karte, auf der Benutzer nach Abholorten und verfügbaren Büchern suchen können.

## Datenbankstruktur

Die Datenbank besteht aus 18 Tabellen, die folgendermaßen strukturiert sind:

- **`user`**: Diese Tabelle speichert die wichtigsten Benutzerdaten wie Vorname, Nachname und Kontaktdaten. Alle Felder außer der Telefonnummer sind Pflichtfelder.

- **`address`**: Diese Tabelle verwaltet die Adressdaten der Benutzer. Alle Felder sind Pflichtfelder. Es werden nur Adressen aus Berlin-Neukölln akzeptiert, da die App zunächst nur diese geografische Region abdeckt.

- **`postal_code`**: Die Tabelle enthält alle Postleitzahlen, die zum Funktionsgebiet gehören.

- **`user_address`**: Dies ist eine Beziehungstabelle, die die Tabellen `user` und `address` miteinander verknüpft.

- **`book_details`**: Diese Tabelle speichert die grundlegenden Informationen zu den Büchern, wie ISBN, Titel, Autor, Verlag, Erscheinungsjahr, Genre, Seitenanzahl und Sprache.

- **`book`**: Die Tabelle verwaltet Daten wie den Zustand, die Verfügbarkeit und die angebotenen Liefermethoden (Versand oder Abholung) für jedes Buch.

- **`postal_code_postal_address`**: Diese Tabelle verwaltet Postleitzahlen, die für den Versand außerhalb des Funktionsgebiets notwendig sind.

- **`postal_address`**: Diese Tabelle speichert Adressdaten von Benutzern außerhalb des Funktionsgebiets für die Versandoption.

- **`user_postal_address`**: Diese Beziehungstabelle verknüpft die Tabellen `user` und `postal_address`.

- **`waitlist`**: Diese Tabelle enthält alle notwendigen Daten zur Verwaltung von Wartelisten für Bücher.

- **`loan`**: Diese Tabelle dient der Verwaltung von Ausleihen und Rückgaben von Büchern.

- **`pickup_transaction`**: Diese Tabelle verwaltet Transaktionen, bei denen Bücher persönlich abgeholt werden.

- **`shipping_transaction`**: Diese Tabelle verwaltet Transaktionen, bei denen Bücher per Versand verschickt werden.

- **`map`**: Diese Tabelle speichert die Daten, die für die visuelle Kartenfunktion benötigt werden, um Abholorte und verfügbare Bücher anzuzeigen.

- **`book_map`**: Diese Beziehungstabelle verknüpft die Tabellen `book` und `map`, um Bücher an bestimmten Standorten auf der Karte darzustellen.

- **`rating`**: Diese Tabelle enthält die Bewertungen der Benutzer und Bücher.

- **`user_rating`**: Diese Beziehungstabelle verknüpft Bewertungen mit den Benutzern, die bewertet werden.

- **`book_rating`**: Diese Beziehungstabelle verknüpft Bewertungen mit den Büchern, die bewertet werden.


## Installation

1. **Voraussetzungen**:
   - MariaDB oder eine ähnliche relationale Datenbank
   - Ein SQL-Editor wie HeidiSQL

2. **Schritt-für-Schritt-Anleitung**:
   - Klone das Repository:
     ```bash
     git clone https://github.com/boroka796/PublicLibrary.git
     ```
   - Öffne die SQL-Dateien in deinem SQL-Editor.
   - Erstelle die Datenbank und führe die SQL-Skripte in folgender Reihenfolge aus:
     1. `code.sql` – Erstellt die Tabellen und fügt einige Beispieldaten ein.
     2. `test.sql` – Führt positive Tests durch, um die Funktionalität der Datenbank zu überprüfen.
     3. `negative_test.sql` – Führt negative Tests durch, um ungültige Eingaben und Fehler zu simulieren.

## Verwendung

1. **Erstellen und Initialisieren der Datenbank**:
   - Führe das `code.sql`-Skript aus, um die Datenbank zu erstellen und die Tabellen zu initialisieren.

2. **Durchführen von Abfragen**:
   - Du kannst Abfragen wie folgt ausführen:
     ```sql
     SELECT * FROM book WHERE availability = 1;
     ```
   - Weitere Abfragen findest du in der Datei `test.sql`.

3. **Hinzufügen und Bearbeiten von Daten**:
   - Füge Daten über SQL-INSERT-Befehle hinzu oder aktualisiere bestehende Datensätze mit SQL-UPDATE-Befehlen.

## Tests

Das Projekt enthält zwei Arten von Tests:

1. **Positive Tests**:
   - Überprüfen, ob die grundlegenden Datenbankoperationen wie das Einfügen, Aktualisieren und Löschen ordnungsgemäß funktionieren.
   - Diese Tests findest du in der Datei `test.sql`.

2. **Negative Tests**:
   - Überprüfen, ob die Datenbank korrekt auf ungültige Eingaben reagiert (z.B. ungültige Fremdschlüssel oder fehlende Pflichtfelder).
   - Diese Tests findest du in der Datei `negative_test.sql`.

## Projektstruktur

```plaintext
sql-datenbankprojekt/
│
├── README.md                    # Projektbeschreibung
├── sql/
│   ├── code.sql                 # Hauptskript zur Erstellung der Datenbank und Tabellen
│   ├── test.sql                 # Positive Testfälle
│   └── negative_test.sql        # Negative Testfälle

## Autoren

- **Zsofia Borok** - boroka796 https://github.com/boroka796/PublicLibrary.git
