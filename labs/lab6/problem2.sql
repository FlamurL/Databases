SELECT
  f.name as fiar_name, l.name as location_name, COUNT(bp.book_title) as book_count
FROM Fair f
JOIN Location l
  ON l.location_id = f.location_id
JOIN Book_Promotion bp
  ON bp.fair_id = f.fair_id
WHERE capacity > 1000
GROUP BY f.name, l.name
ORDER BY book_count ASC;
