{{
     config(
         materialized='incremental',
         unique_key='ITEM_ID',
         merge_update_columns=['ITEM_DESC','RCD_UPD_TS']
     )
}}
{% if is_incremental() %}
    SELECT
        ITEM_ID,
        ITEM_DESC,
        current_timestamp as RCD_INS_TS,
        current_timestamp as RCD_UPD_TS
    FROM {{ref("tmp_d_prd_itm")}}
{% else %}
    SELECT
        ITEM_ID,
        ITEM_DESC,
        current_timestamp as RCD_INS_TS,
        current_timestamp as RCD_UPD_TS
    FROM {{ref("tmp_d_prd_itm")}}
{% endif %}