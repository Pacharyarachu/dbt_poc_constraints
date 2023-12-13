{{
  config(
  materialized='table',
  )
}}
select 
    TRANSACTION_DT,
    TRANSACTION_ID,
    LOCATION_ID,
    ITEM_ID,
    TXN_AMT,
    TXN_QTY,
    current_timestamp AS RCD_INS_TS,
    current_timestamp AS RCD_UPD_TS
from {{ ref('stg_f_sls_ln_itm_b')}} sls