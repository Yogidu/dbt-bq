
-- Use the `ref` function to select from other models

{{ config(materialized='table') }}


with stage_data as (
select Account_Number from `sound-habitat-385613.Staging.datalake`
where  Account_Number not in (
    select Account_Number from {{ ref('stage') }}
)
)

select *
from stage_data bad_acc , `sound-habitat-385613.Staging.datalake` src
where bad_acc.Account_Number =src.Account_Number
