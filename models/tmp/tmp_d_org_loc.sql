select 
    LOCATION_ID,
    LOCATION_DESC,
    current_timestamp AS RCD_INS_TS,
    current_timestamp AS RCD_UPD_TS
from {{ ref('stg_d_org_loc')}}