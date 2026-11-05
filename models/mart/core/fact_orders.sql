with payments as (
    select
        order_id,
        sum(amount) as amount
    from {{ ref('stg_payments') }}
    group by 1
),

orders as (
    select
        order_id,
        customer_id,
        order_date,
        status
    from {{ ref('stg_orders') }}
),

final as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        coalesce(p.amount, 0) as amount
    from orders o
    left join payments p on o.order_id = p.order_id
)

select *
from final
