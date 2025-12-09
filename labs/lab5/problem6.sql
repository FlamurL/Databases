SELECT HF.date, F.name
FROM Held_Fair HF
JOIN Fair F 
    ON HF.fair_id = F.fair_id
JOIN Location L
    ON F.location_id = L.location_id
WHERE L.type = 'OUTDOOR'
  AND L.capacity < 500
ORDER BY HF.date ASC;
