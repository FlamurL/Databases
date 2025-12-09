SELECT DISTINCT A.artistic_name AS name, 'Author' AS type
FROM Author A
JOIN Book_Promotion BP
    ON A.author_id = BP.author_id
WHERE BP.rating > 4

UNION

SELECT DISTINCT P.name AS name, 'Publisher' AS type
FROM Publisher P
JOIN Publisher_Promotion PP
    ON P.publisher_id = PP.publisher_id
WHERE (PP.start_date <= '2024-12-31' AND PP.end_date >= '2024-01-01')
ORDER BY name;
