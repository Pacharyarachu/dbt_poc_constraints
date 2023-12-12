{{
  config(
  materialized='table'
  )
}}
select 
    SLS.TRANSACTION_DT,
    SLS.TRANSACTION_ID,
    LOC.LOCATION_ID,
    LOC.LOCATION_DESC,
    ITM.ITEM_ID,
    ITM.ITEM_DESC,
    SLS.TXN_AMT,
    SLS.TXN_QTY,
    0  AS DSC_AMT,
    current_timestamp AS RCD_INS_TS,
    current_timestamp AS RCD_UPD_TS
from {{ ref('stg_f_sls_ln_itm_b')}} sls
inner join {{ref('dwh_d_org_loc')}} loc
on sls.location_id = loc.location_id
inner join {{ref('dwh_d_prd_itm')}} itm 
on sls.item_id = itm.item_id