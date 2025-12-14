SELECT
  a.author_id, a.artistic_name
FROM Author a
JOIN Publisher_Promotion pp
  ON pp.author_id = a.author_id
JOIN Publisher_Sponsor ps
  ON ps.publisher_id = pp.publisher_id
GROUP BY a.author_id, a.artistic_name, pp.publisher_id
HAVING COUNT(ps.sponsor) = (
    SELECT MAX(sponsor_count)
    FROM (
        SELECT COUNT(sponsor) AS sponsor_count
        FROM Publisher_Sponsor
        GROUP BY publisher_id
    )
);
