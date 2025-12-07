
use bist_stock_analysis;

# exploration

-- dataset summary
select count(*) as total_rows,
min(date) as start_date,
max(date) as end_date
from stocks;

-- records per stock
select stock_name, count(*) as total_records
from stocks
group by stock_name
order by total_records desc;

-- price summary statistics
select stock_name,
round(min(close), 4) as min_price,
round(max(close), 4) as max_price,
round(avg(close), 4) as avg_price,
round(stddev(close), 4) as stddev_price
from stocks
group by stock_name;

-- missing daily return check (to make sure)
select stock_name, count(*) as missing_daily_return
from stocks
where daily_return is null
group by stock_name;

-- most extrime daily movements (volatility spikes)
select date, stock_name, daily_return
from stocks
where daily_return is not null
order by abs(daily_return) desc
limit 25;





