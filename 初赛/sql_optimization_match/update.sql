update `order` set
create_time = now()
where id in (
    select parent from order_item where type = 2
)