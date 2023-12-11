{{
     config(
         materialized='incremental',
         unique_key='LOCATION_ID',
         merge_update_columns=['LOCATION_DESC','RCD_UPD_TS']
     )
}}
{% if is_incremental() %}
    SELECT
        LOCATION_ID,
        LOCATION_DESC,
        current_timestamp as RCD_INS_TS,
        current_timestamp as RCD_UPD_TS
    FROM {{ref("tmp_d_org_loc")}}
{% else %}
    SELECT
        LOCATION_ID,
        LOCATION_DESC,
        current_timestamp as RCD_INS_TS,
        current_timestamp as RCD_UPD_TS
    FROM {{ref("tmp_d_org_loc")}}
{% endif %}