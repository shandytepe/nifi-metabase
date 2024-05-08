-- top 10 spender in chinook
select 
    concat(dc.first_name, ' ', dc.last_name) as full_name,
    sum(fst.total_invoice) as total_transaction
from fct_sales_transaction fst 
join dim_customer dc
    on dc.customer_id = fst.customer_id
group by 1
order by total_transaction desc
limit 10

-- top 5 most ordered country
select 
    billing_country,
    count(billing_country) as qty_order
from fct_sales_transaction
group by 1
order by qty_order desc
limit 5

-- top 5 buy album
-- get most top sell album
select 
    da.title as album_title,
    count(fst.album_id) as qty_sell_album
from fct_sales_transaction fst
join dim_album da 
    on da.album_id = fst.album_id
group by 1
order by qty_sell_album desc
limit 5

-- most popular genre
select 
    dg.name as popular_genre,
    count(dg.genre_id) as qty
from fct_sales_transaction fst 
join dim_genre dg 
    on dg.genre_id = fst.genre_id
group by 1
order by qty desc
limit 1

-- most popular format audio

select 
    dmt.name as popular_format_audio,
    count(fst.media_type_id) as qty
from fct_sales_transaction fst 
join dim_media_type dmt 
    on dmt.media_type_id = fst.media_type_id
group by 1 
order by qty desc
limit 1

-- frequency order time
select 
    dd.day_name as day_name,
    count(fst.invoice_id) as qty
from fct_sales_transaction fst 
join dim_date dd 
    on dd.date_id = fst.invoice_date
group by 1
order by 
    case 
        when day_name = 'Monday' then 1
        when day_name = 'Tuesday' then 2
        when day_name = 'Wednesday' then 3
        when day_name = 'Thursday' then 4
        when day_name = 'Friday' then 5
        when day_name = 'Saturday' then 6
        when day_name = 'Sunday' then 7
    end asc