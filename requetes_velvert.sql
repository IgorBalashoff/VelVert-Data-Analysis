-- Vel'Vert — SQL analysis
-- Training project: Simplon Data Analyst Programme, 2026
-- Database: PostgreSQL
-- Tables used: stations, trajets
--
-- This file gathers the SQL queries recovered from the training work.
-- Some extra practice queries did not have an original question number;
-- they are grouped in the "Additional practice" section at the end.

-- ============================================================
-- 1. STATIONS
-- ============================================================

-- Q1. Afficher le nom des stations et le nombre de vélos disponibles.
SELECT nom_station, velos_disponibles
FROM stations;

-- Q2. Afficher toutes les colonnes de la table stations.
SELECT *
FROM stations;

-- Q3. Afficher les stations qui ont plus de 20 emplacements.
SELECT nom_station, capacite_totale
FROM stations
WHERE capacite_totale > 20;

-- Q4. Afficher les stations qui ont moins de 5 vélos disponibles.
SELECT nom_station, velos_disponibles
FROM stations
WHERE velos_disponibles < 5;

-- Q5. Afficher les stations du quartier Centre.
SELECT nom_station, velos_disponibles
FROM stations
WHERE quartier = 'Centre';

-- Q6. Afficher les stations qui ne sont pas dans le quartier Centre.
SELECT nom_station, velos_disponibles
FROM stations
WHERE quartier <> 'Centre';

-- Q7. Afficher les stations avec au moins 10 vélos disponibles.
SELECT nom_station, velos_disponibles
FROM stations
WHERE velos_disponibles >= 10;

-- Q8. Afficher les stations de la plus grande à la plus petite capacité.
SELECT nom_station, capacite_totale
FROM stations
ORDER BY capacite_totale DESC;

-- Q9. Afficher les stations par ordre alphabétique.
SELECT nom_station, velos_disponibles
FROM stations
ORDER BY nom_station ASC;

-- Q10. Repérer les stations dont le taux de disponibilité est inférieur à 20 %.
SELECT nom_station, velos_disponibles, capacite_totale
FROM stations
WHERE velos_disponibles < capacite_totale * 0.2;

-- Q11. Repérer les stations dont le taux de remplissage dépasse 80 %.
SELECT nom_station, velos_disponibles
FROM stations
WHERE velos_disponibles > capacite_totale * 0.8;

-- Q12. Afficher les stations ayant plus de 15 emplacements libres.
SELECT nom_station, velos_disponibles, capacite_totale
FROM stations
WHERE capacite_totale - velos_disponibles > 15;


-- ============================================================
-- 2. TRAJETS
-- ============================================================

-- Q13. Afficher les trajets de plus de 30 minutes.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
WHERE duree_minutes > 30;

-- Q14. Afficher les cinq trajets les plus longs.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
ORDER BY duree_minutes DESC
LIMIT 5;

-- Q15. Afficher les cinq trajets les plus courts.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
ORDER BY duree_minutes ASC
LIMIT 5;

-- Q16. Afficher les trajets du 22 septembre 2026.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
WHERE date_trajet = '2026-09-22';

-- Q17. Afficher les trajets du 21 au 25 septembre 2026 inclus.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
WHERE date_trajet >= '2026-09-21'
  AND date_trajet <= '2026-09-25';

-- Q18. Repérer les trajets de moins de 10 minutes ou de plus de 40 minutes.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
WHERE duree_minutes < 10
   OR duree_minutes > 40;

-- Q19. Afficher les trajets dont la durée est comprise entre 10 et 40 minutes.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
WHERE duree_minutes > 10
  AND duree_minutes < 40;

-- Q20. Afficher les trajets partis de la station 3 et ayant duré plus de 20 minutes.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
WHERE station_depart_id = 3
  AND duree_minutes > 20;

-- Q21. Afficher les trajets partis de la station 1 entre le 21 et le 24 septembre 2026 inclus.
SELECT trajet_id, station_depart_id, duree_minutes, date_trajet
FROM trajets
WHERE station_depart_id = 1
  AND date_trajet >= '2026-09-21'
  AND date_trajet <= '2026-09-24';


-- ============================================================
-- 3. FILTRES ET PRIORISATION DES STATIONS
-- ============================================================

-- Q22. Afficher les stations du quartier Centre avec moins de 10 vélos disponibles.
SELECT nom_station, velos_disponibles, capacite_totale
FROM stations
WHERE quartier = 'Centre'
  AND velos_disponibles < 10;

-- Q23. Afficher les stations des quartiers Nord ou Ouest.
SELECT nom_station, velos_disponibles
FROM stations
WHERE quartier = 'Nord'
   OR quartier = 'Ouest';

-- Q24. Afficher les stations dont la capacité est comprise entre 15 et 24 emplacements.
SELECT nom_station, velos_disponibles, capacite_totale
FROM stations
WHERE capacite_totale >= 15
  AND capacite_totale < 25;

-- Q25. Afficher les trois stations ayant le moins de vélos disponibles.
SELECT nom_station, velos_disponibles
FROM stations
ORDER BY velos_disponibles ASC
LIMIT 3;

-- Q26. Afficher les stations installées avant le 1er janvier 2023.
SELECT nom_station, date_installation
FROM stations
WHERE date_installation < '2023-01-01';

-- Q27. Prioriser les stations dont le taux de disponibilité est inférieur à 20 %,
-- en classant la station la plus urgente en premier.
SELECT
    nom_station,
    velos_disponibles,
    capacite_totale,
    quartier,
    ROUND(velos_disponibles * 100.0 / capacite_totale, 1) AS taux_disponibilite
FROM stations
WHERE velos_disponibles < capacite_totale * 0.2
ORDER BY taux_disponibilite ASC;


-- ============================================================
-- 4. REQUÊTES D'ENTRAÎNEMENT COMPLÉMENTAIRES
-- ============================================================

-- Afficher les cinq premières lignes de stations.
SELECT *
FROM stations
LIMIT 5;

-- Afficher les stations dont le nom commence par la lettre B.
SELECT nom_station
FROM stations
WHERE nom_station LIKE 'B%';

-- Afficher les stations dont le nom contient la lettre t.
SELECT nom_station
FROM stations
WHERE nom_station LIKE '%t%';

-- Afficher les stations qui ont exactement 5 vélos disponibles.
SELECT nom_station, velos_disponibles
FROM stations
WHERE velos_disponibles = 5;

-- Afficher les stations où la capacité totale est supérieure au nombre de vélos disponibles.
SELECT nom_station, velos_disponibles, capacite_totale
FROM stations
WHERE capacite_totale > velos_disponibles;

-- Afficher les trajets de plus de 25 minutes, du plus long au plus court.
SELECT trajet_id, duree_minutes
FROM trajets
WHERE duree_minutes > 25
ORDER BY duree_minutes DESC;
