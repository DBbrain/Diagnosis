SELECT *
FROM   `order` o
       INNER JOIN order_item i ON i.parent = o.id
ORDER  BY o.status ASC,
          i.update_time DESC
LIMIT  0, 20