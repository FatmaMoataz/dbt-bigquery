
with payments as (

    select *
    from {{ ref('stg_payments') }}

),

final as (

    select
        payment_id,
        order_id,
        payment_method,
        status,
        amount,
        created_at
    from payments

)

select *
from final
