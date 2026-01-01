# deutsche-bahn-punctuality-analysis
Data Analytics Projekt zur Analyse der Pünktlichkeit der Deutschen Bahn unter Verwendung von SQL (BigQuery) und Tableau.

# Deutsche Bahn Pünktlichkeits-Analyse 🚆📊

## Projektübersicht
Dieses Projekt untersucht die Pünktlichkeitsdaten der Deutschen Bahn. Ziel ist es, Muster in den Verspätungen nach Bundesland, Zugtyp und Standort zu identifizieren.

## Verwendete Daten
- **Quelle:** Kaggle (DB Train Stops & Delays)
- **Datenumfang:** Über 5,7 Mio. Datensätze
- **Struktur:** Stammdaten der Bahnhöfe & transaktionale Verspätungsdaten

## Tech Stack
- **Google Cloud Storage:** Hosting der Rohdaten (CSV)
- **BigQuery (SQL):** Datenreinigung, Transformation und Analyse
- **Tableau:** (In Arbeit) Visualisierung der Ergebnisse

## Analyse-Schritte (Google Data Analytics Zertifikat Methodik)
1. **Ask:** Definition der Business-Fragen.
2. **Prepare:** Datenbeschaffung und Prüfung der Integrität.
3. **Process:** Datenreinigung und Verknüpfung (siehe `scripts/` Ordner).
4. **Analyze:** (Aktueller Schritt) Statistische Auswertung in SQL.

##Beobachtung während der Analyse:

„Während der Verarbeitungsphase ergab eine eingehende Prüfung der Rohdaten, dass die Spalten scheduled_time (geplante Zeit) und expected_time (erwartete Zeit) in über 99 % der Datensätze identisch waren. Dies deutet darauf hin, dass die 'erwarteten' Werte in diesem spezifischen Datensatz nicht mit Echtzeit-Verspätungsinformationen aktualisiert wurden.“

##Ergriffene Maßnahmen:

„Anstatt das Projekt abzubrechen, habe ich die Analyse neu ausgerichtet (Pivot). Der Fokus liegt nun auf der Bahnhofsdichte und der geografischen Verteilung der Infrastruktur. Dies demonstriert meine Fähigkeit, mich an Datenbeschränkungen anzupassen und dennoch wertvolle Erkenntnisse aus den vorhandenen Informationen zu gewinnen.“
