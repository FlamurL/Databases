SELECT DISTINCT A.author_id, A.artistic_name, A.nationality
FROM Author A
JOIN Publisher_Promotion PP 
    ON A.author_id = PP.author_id
JOIN Publisher P
    ON PP.publisher_id = P.publisher_id
LEFT JOIN Publisher_Sponsor PS
    ON P.publisher_id = PS.publisher_id
WHERE PS.publisher_id IS NULL
ORDER BY A.author_id;
