
create database `bist_stock_analysis`;
use `bist_stock_analysis`;

# check the entire table
select * from stocks;

# check the datatype
describe stocks;

# change the datatype of column "date" into date
alter table stocks
modify date date;

# change the datatype of column daily return from text into double
alter table stocks
modify daily_return double;

# because there are probably some null value so we cannot alter the table right away
# replace those values into null values

update stocks
set daily_return = null 
where (daily_return = '' or daily_return = ' ')
and date is not null;


# check if there still non numeric values
select daily_return
from stocks
where daily_return regexp '^0-9.'
and daily_return is not null;

# check the null values on daily_return
select *
from stocks
where daily_return is null;


# basic cleaning check

-- check the total stocks records
select count(*) as Total_Records
from stocks;

select * from stocks;

-- check missing values for each rows
select sum(stock_name is null) as missing_stock_name,
		sum(open is null) as missing_open,
        sum(high is null) as missing_high,
        sum(low is null) as missing_low,
        sum(close is null) as missing_close,
        sum(daily_return is null) as missing_daily_return,
        sum(adj_close is null) as missing_adj_close,
        sum(volume is null) as missing_volume
from stocks;

/* the data is fairly clean but there still are 586 missing values in the daily_return column. 
some stock datasets do not include returns for the first day or
days without trading but let's first check the total of different stock*/

select distinct(stock_name) 
from stocks;

-- there are only 9 different stocks

# fill the missing values
-- The usual formula for daily return is:
-- ((Close price today − Close price yesterday) / Close price yesterday) * 100

/* Because we have different banks here, 
we need to calculate daily_return separately for each stock to keep the data accurate.
we can calculate it grouped by stock_name, so the returns for each bank don’t get mixed up. */


update stocks s
join ( select stock_name, date, close,
	lag(close) over (partition by stock_name order by date) as previous_close
	from stocks) t
on s.stock_name = t.stock_name and s.date = t.date
set s.daily_return = round(((s.close - t.previous_close) / t.previous_close) * 100, 4)
where t.previous_close is not null;

-- change it into persentage (decimal)
update stocks
set daily_return = daily_return / 100;

-- let's check it again to make sure the total daily_return are decraced
select sum(daily_return is null) as null_daily_return
from stocks;


# find the duplicated data
select stock_name, date, count(*) as duplicate_count
from stocks
group by stock_name, date
having duplicate_count > 1;



