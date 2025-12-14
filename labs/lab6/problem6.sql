with temp as (
select 
    l.location_id, l.name as location_name, a.author_id, a.artistic_name as author_name, count(bp.book_title) as number_of_books,avg(bp.rating) AS average_rating
    from Location l
    join Fair f on f.location_id = l.location_id
    join Held_Fair hf on hf.fair_id = f.fair_id
    join Book_Promotion bp on bp.fair_id = hf.fair_id and bp.date = hf.date
    join Author a on a.author_id = bp.author_id
    group by l.location_id, l.name, a.author_id, a.artistic_name
)

select t1.location_name, t1.author_name, t1.number_of_books, t1.average_rating
from temp t1
where (
    select count(*) 
    from temp t2
    where t2.location_id = t1.location_id
        and t2.average_rating > t1.average_rating
) < 3
ORDER BY t1.location_name ASC, t1.average_rating DESC;
