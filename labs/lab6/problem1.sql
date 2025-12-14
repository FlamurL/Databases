SELECT DISTINCT
  a.author_id, a.artistic_name, COUNT(*) AS number_of_fairs
FROM Author a
JOIN Book_Promotion bp
  ON bp.author_id = a.author_id AND hf.date = bp.date
JOIN Held_Fair hf
  ON hf.fair_id = bp.fair_id
WHERE bp.rating < 6
GROUP BY a.author_id, a.artistic_name
HAVING COUNT(*) >= 2
