
use `bist_stock_analysis`;

# time_series_analysis

-- Create rolling 30-day moving avg + volatility
drop view if exists vw_rolling30;
create view vw_rolling30 as
select stock_name, date, close,
round(avg(close) over (partition by stock_name order by date rows between 29 preceding and current row),4) as ma30,
round(stddev(close) over (partition by stock_name order by date rows between 29 Preceding and current row),4) as vol30
from stocks;

select * from vw_rolling30;


-- create cumulative return vie
drop view if exists vw_cumulative_return ;
create view vw_cumulative_return as 
select stock_name, date,close,
first_value(close) over (partition by stock_name order by date) as first_price,
round(((close / first_value(close) over (partition by stock_name order by date)) - 1) * 100, 2) as cumulative_return_pct
from stocks;

select * from vw_cumulative_return;

-- rolling dropdown view
drop view if exists vw_drawdown;
create view vw_drawdown as
select stock_name, date, close, 
max(close) over (partition by stock_name order by date) as peak_value,
round((close / max(close) over (partition by stock_name order by date) - 1) * 100, 2) as drawdown_pct
from stocks;
select * from vw_drawdown;

-- query: words drawdown per stock
select stock_name, min(drawdown_pct) as max_drawdown_pct
from vw_drawdown
group by stock_name
order by max_drawdown_pct asc;




