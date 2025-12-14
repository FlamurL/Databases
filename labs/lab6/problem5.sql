SELECT DISTINCT
  bp.book_title
FROM Book_Promotion bp
JOIN Fair f
  ON f.fair_id = bp.fair_id
JOIN Location l
  ON f.location_id = l.location_id
WHERE l.type = 'INDOOR'
  AND l.capacity = (
      SELECT MAX(capacity)
      FROM Held_Fair hf
      JOIN Fair f 
        ON f.fair_id = hf.fair_id
      JOIN Location l
        ON l.location_id = f.location_id
      WHERE type = 'INDOOR'
  )
ORDER BY bp.book_title ASC;
