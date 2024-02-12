
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select * FROM `sound-habitat-385613.Staging.datalake` 

)

select 
safe_cast(Date as Date)	as Date,		
case 
 when Transaction_Type='Credit'
 then 'C'
 when Transaction_Type='Debit'
 then 'D'	
 else null
 end as Transaction_Type , 
Name	,			
Place	,		
Bank	,			
safe_cast(Account_Number as int64) as Account_Number	,			
safe_cast(Amount as FLOAT64)	as Amount,			
Currency	,			
Category	,			
case 
 when Notes is null 
 then 'NA'
 end as Notes
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
