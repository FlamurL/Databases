SELECT a.author_id, a.artistic_name, a.nationality
FROM Author a
WHERE a.author_id NOT IN (
    SELECT bp.author_id
    FROM Book_Promotion bp
    WHERE bp.author_id IS NOT NULL
)
ORDER BY a.author_id;
