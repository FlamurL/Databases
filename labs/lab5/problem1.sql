SELECT DISTINCT a.artistic_name, a.nationality
FROM Author a
JOIN Book_Promotion bp ON a.author_id = bp.author_id
JOIN Publisher p ON bp.publisher_id = p.publisher_id
WHERE bp.rating > 6
  AND p.name LIKE 'New%'
ORDER BY bp.rating ASC;
