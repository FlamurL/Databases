SELECT DISTINCT F.name AS fair_name, L.name AS location_name
FROM Fair F
JOIN Held_Fair HF
    ON F.fair_id = HF.fair_id
JOIN Location L
    ON F.location_id = L.location_id
WHERE L.capacity > 1000
ORDER BY F.name ASC;
