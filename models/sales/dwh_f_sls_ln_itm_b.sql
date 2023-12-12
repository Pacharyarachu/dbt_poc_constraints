{{
     config(
         materialized='incremental',
         unique_key='TRANSACTION_ID',
         merge_update_columns=['TRANSACTION_DT','LOCATION_ID', 'LOCATION_DESC','ITEM_ID', 'ITEM_DESC','TXN_AMT', 'TXN_QTY', 'RCD_UPD_TS']
     )
}}
{% if is_incremental() %}
SELECT 
    TRANSACTION_DT,
    TRANSACTION_ID,
    LOCATION_ID,
    LOCATION_DESC,
    ITEM_ID,
    ITEM_DESC,
    TXN_AMT,
    TXN_QTY,
    current_timestamp AS RCD_INS_TS,
    current_timestamp AS RCD_UPD_TS
    FROM {{ref('tmp_f_sls_ln_itm_b')}}
{% else %}
SELECT 
    TRANSACTION_DT,
    TRANSACTION_ID,
    LOCATION_ID,
    LOCATION_DESC,
    ITEM_ID,
    ITEM_DESC,
    TXN_AMT,
    TXN_QTY,
    current_timestamp AS RCD_INS_TS,
    current_timestamp AS RCD_UPD_TS
    FROM {{ref('tmp_f_sls_ln_itm_b')}}
{% endif %}