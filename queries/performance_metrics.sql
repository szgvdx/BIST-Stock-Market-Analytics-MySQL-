
use `bist_stock_analysis`;

# performance_metricks

-- Annualized volatility & returns
select stock_name,
round(stddev(daily_return)* sqrt(252) * 100, 2) as annualized_volatility_pct,
round(avg(daily_return)* 252 * 100, 2) as annualized_return_pct
from stocks
where daily_return is not null
group by stock_name
order by annualized_return_pct desc;

-- CAGR per stock
select stock_name,
round(
	(power((max(close)/min(close)), 1 / (datediff(max(date), min(date)) / 365.25)) - 1) * 100,
    2) as CAGR_pct
from stocks
group by stock_name
order by CAGR_pct DESC;

# sharpe-like ratio (no risk-free rate)
with metrics as (
select stock_name,
avg(daily_return) * 252 as ann_return,
stddev(daily_return) * sqrt(252) as ann_volatility
from stocks
where daily_return is not null
group by stock_name)

select stock_name,
round(ann_return * 100, 2) as annualized_return_pct,
round(ann_volatility * 100, 2) as annualized_volatility_pct,
round(ann_return / ann_volatility, 3) as sharpe_like_ratio
from metrics
order by sharpe_like_ratio desc;


