
use `bist_stock_analysis`;

# FINAL INSIGHTS (SUMMARY)

-- Top highest CAGR
select stock_name, CAGR_pct
from(
select stock_name,
round((power((max(close)/min(close)), 1 / (datediff(max(date), min(date)) / 365.25)) - 1) * 100,
2) as CAGR_pct
from stocks
group by stock_name) t
order by CAGR_pct desc
limit 5;

-- top 5 most volatile stocks
select stock_name, annualized_volatility_pct
from(
select stock_name,
round(stddev(daily_return) * sqrt(252) * 100, 2) as annualized_volatility_pct
from stocks
where daily_return is not null
group by stock_name) v
order by annualized_volatility_pct desc
limit 5;

-- sticks with greatest max drawdown
select stock_name, min(drawdown_pct) as worst_drawdown_pct
from vw_drawdown
group by stock_name
order by worst_drawdown_pct asc
limit 5;

-- most actively traded (liquidity check)
select stock_name,
round(avg(volume)) as avg_volume
from stocks
group by stock_name
order by avg_volume desc
limit 5;

-- extreme negative return days (risk events)
select date, stock_name, 
round(daily_return, 2) as daily_return
from stocks
where daily_return is not null
order by daily_return asc
limit 10;
