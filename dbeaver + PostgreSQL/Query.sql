-- 1 Berapa rata-rata umur customer jika dilihat dari marital statusnya ?
select
	case "Marital Status"
        when '' then 'Unknown'
        else "Marital Status"
    end "Marital Status",
    round(avg(age), 3) as "average age"
from customer
group by "Marital Status"
order by "average age" asc;

-- 2 Berapa rata-rata umur customer jika dilihat dari gender nya ?
select
	case gender
		when null then 'Unknown'
        when 0 then 'Female'
        when 1 then 'Male'
    end gender,
    round(avg(age), 3) as "average age"
from customer
group by gender
order by "average age" asc;

-- 3 Tentukan nama store dengan total quantity terbanyak!
select
	store.storename as "Store Name",
	sum(transaction.qty) as "total quantity"
from store join "transaction" on transaction.storeid  = store.storeid
group by "Store Name"
order by "total quantity" desc
limit 1;

-- 4 Tentukan nama produk terlaris dengan total amount terbanyak!
select
	product."Product Name" as "Product Name",
	sum(transaction.totalamount) as "total amount"
from product join "transaction" on transaction.productid = product.productid 
group by "Product Name"
order by "total amount" DESC
limit 1;



