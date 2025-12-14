SELECT DISTINCT
  bp.book_title
FROM Book_Promotion bp
JOIN Publisher p
  ON p.publisher_id = bp.publisher_id
JOIN Publisher_Sponsor ps
  ON ps.publisher_id = p.publisher_id
GROUP BY bp.book_title, p.publisher_id
HAVING COUNT(ps.sponsor) > 3
ORDER BY bp.book_title ASC;
