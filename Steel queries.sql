use Steelproduction
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;
EXEC sp_rename 'RS_Session_266_AU_629_A_ii', 'crude_steel_raw';
 
EXEC sp_rename 'RS_Session_266_AU_1431_A_to_D_ii', 'finished_steel_raw';
 
EXEC sp_rename 'RS_Session_265_AU_2228_A_to_D', 'imports_raw';
 
EXEC sp_rename 'RS_Session_265_AU_2230_A_to_E', 'exports_raw';
 
EXEC sp_rename '[829137af-5e90-4400-bffe-5d65b66e5956]', 'monthly_production_raw';
 
-- Verify the rename worked:
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;
-- TOP 5 state for crude steel 
SELECT TOP 5 * FROM crude_steel_raw;

SELECT
    State_UT AS state,
    year,
    qty AS crude_steel_qty
INTO crude_steel_by_state
FROM crude_steel_raw
UNPIVOT (
    qty FOR year IN (_2021_22, _2022_23, _2023_24)
) AS unpvt;

Select *
From crude_steel_raw;
SELECT * FROM crude_steel_by_state;
SELECT COUNT(*) FROM crude_steel_by_state;
--TOP 5 state for finished steel
SELECT TOP 5 * FROM finished_steel_raw;
select 
 State_UT as state,
 year,
 prod as finished_steel_quantity
 into finished_steel_by_state
 from finished_steel_raw
 unpivot (prod for year in (_2019_20,_2020_21,_2021_22,_2022_23,_2023_24))
 as unpvt;
 select*
 from finished_steel_by_state;

 SELECT TOP 5 * FROM imports_raw;
 select 
 country,
 year,
 import as raw_steel_imports
 into raw_steel_by_country
 from imports_raw
 unpivot (import for year in (_2019_20,_2020_21,_2021_22,_2022_23,_2023_24))
 as unpvt;
 select*
 from raw_steel_by_country
 SELECT TOP 5 * FROM exports_raw;

 select 
country_region as country,
year,
export as raw_steel_exports
into raw_steel_by_country_export
from exports_raw
unpivot (export for year in (_2019_20,_2020_21,_2021_22,_2022_23,_2023_24))
as unpvt;
select * from raw_steel_by_country_export;
SELECT TOP 10 * FROM monthly_production_raw;

select 
    PRODUCER_TYPE as producer_type,
    MONTH as month,
    CAL_YEAR as cal_year,
    FIN_YEAR as fin_year,
    DATA_TYPE as data_type,
    QTY as qty,
    STATUS as status,
    MONTH_NO as month_no

from monthly_production_raw;
select 
    coalesce(i.country, e.country) as country,
    i.year,
    isnull(i.raw_steel_imports, 0) as import_qty,
    isnull(e.raw_steel_exports, 0) as export_qty,
    isnull(e.raw_steel_exports, 0) - isnull(i.raw_steel_imports, 0) as trade_balance
from raw_steel_by_country i
full outer join raw_steel_by_country_export e
    on i.country = e.country and i.year = e.year
order by i.year, trade_balance desc;


select top 6
    state,
    year,
    crude_steel_qty
from crude_steel_by_state
where year = '_2023_24' and state != 'total'

order by crude_steel_qty desc;

Select 
state,
year,
crude_steel_qty,

lag (crude_steel_qty) over (partition by state order by year)as previous_year_qty,

round ( ((crude_steel_qty - lag (crude_steel_qty) over (partition by state order by year))*100.00)/lag (crude_steel_qty) over (partition by state order by year) ,2) as growth_by_year

from crude_steel_by_state
where state!= 'total'
order by state, year,growth_by_year;

select
c.state ,c.year,
c.crude_steel_qty, f.finished_steel_quantity,
round((c.crude_steel_qty*1.0)/NULLIF (f.finished_steel_quantity,0),2) as crude_to_finished_steel_ratio
FROM crude_steel_by_state c
full outer join finished_steel_by_state f
on c.state= f.state AND  c.year = f.year
where c.state!='total'
order by c.state , c.year,crude_to_finished_steel_ratio;

 select 
 coalesce (i.year, e.year) as year ,
 sum(i.raw_steel_imports) as total_imports,
 sum(e.raw_steel_exports) as total_exports,
 sum(e.raw_steel_exports)-sum(i.raw_steel_imports) as steel_trade_balance
 from raw_steel_by_country i
  full outer join raw_steel_by_country_export e
 on i.year = e.year and i.country= e.country 
 group by coalesce (i.year,e.year)
 order by year;

 select *
 from monthly_production_raw;

 select 
 Producer_type,
 data_type,
 cal_year,
 sum(qty)as total_quantity_by_type 
 from monthly_production_raw
 group by producer_type ,data_type,cal_year
 order by data_type , cal_year;


 select*
 from monthly_production;
 select
 cal_year,
 data_type,
 month,
 sum(qty) as total_quantity_in_months
 from monthly_production
 where data_type='crude_steel_prod' or data_type='finished_steel_prod'
 group by month, data_type,cal_year
 order by month, data_type,cal_year;

 select*
 from finished_steel_raw;

 select 
 top 6 state,
  sum(finished_steel_quantity) as total_steel,
  avg(finished_steel_quantity) as avg_steel
  from finished_steel_by_state
  where state !='Total'
  group by state
  order by total_steel desc;
  
