## DBbrain建议

### 新表结构及索引

```sql
    CREATE TABLE `region` (
    `regionkey` int(11) NOT NULL,
    `name` varchar(25) NOT NULL,
    `comment` varchar(152) DEFAULT NULL,
    PRIMARY KEY (`regionkey`)
    )

    CREATE TABLE `nation` (
    `nationkey` int(11) NOT NULL,
    `name` char(25) NOT NULL,
    `regionkey` int(11) NOT NULL,
    `comment` varchar(152) DEFAULT NULL,
    PRIMARY KEY (`nationkey`),
    KEY `index_0` (`name`)
    )

    CREATE TABLE `customer` (
    `custkey` int(11) NOT NULL,
    `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `address` varchar(40) NOT NULL,
    `nationkey` int(11) NOT NULL,
    `phone` char(15) NOT NULL,
    `acctbal` decimal(15,2) NOT NULL,
    `mktsegment` char(10) NOT NULL,
    `comment` varchar(117) NOT NULL,
    PRIMARY KEY (`custkey`),
    KEY `index_1` (`phone`,`nationkey`,`name`),
    KEY `index_2` (`nationkey`),
    KEY `index_0` (`name`,`phone`)
    )

    CREATE TABLE `orders` (
    `orderkey` int(11) NOT NULL,
    `custkey` int(11) NOT NULL,
    `orderstatus` varchar(1) NOT NULL,
    `totalprice` decimal(15,2) NOT NULL,
    `orderdate` date NOT NULL,
    `orderpriority` char(15) NOT NULL,
    `clerk` char(15) NOT NULL,
    `shippriority` int(11) NOT NULL,
    `comment` varchar(79) NOT NULL,
    PRIMARY KEY (`orderkey`),
    KEY `index_0` (`orderdate`,`custkey`,`totalprice`),
    KEY `index_3` (`clerk`,`totalprice`),
    KEY `index_1` (`custkey`,`totalprice`)
    )

```


### SQL语句

#### select1
```sql
    select c.custkey, c.phone, sum(o.totalprice) totalprice
    from nation n 
    inner join customer c on c.nationkey = n.nationkey
    inner join orders o on o.clerk   = c.name  COLLATE utf8_bin
    where n.name = 'CHINA' and c.mktsegment = 'HOUSEHOLD' and c.phone like '28-520%'
    group by c.custkey, c.phone

```

#### select2
```sql
    SELECT
    `t`.`custkey`,
    `t`.`orderdate`,
    SUM(`t`.`totalprice`) AS `totalprice`
    FROM
    `dbaas`.`orders` AS `t`
    WHERE
    `t`.`orderdate` = '2019-08-01'
    GROUP BY
    `t`.`custkey`,
    `t`.`orderdate`
```

### select3
```sql
    select c.custkey, sum(o.totalprice) totalprice
    from customer c 
    left join orders o on o.custkey = c.custkey
    where c.phone like "33-64%" and c.name like concat("Customer#00003", "%")
    group by c.custkey
```

#### select4
```sql
    SELECT
    `t1`.`custkey`,
    `t1`.`phone`
    FROM
    (
        SELECT
        *
        FROM
        `dbaas`.`nation` AS `t`
        WHERE
        `t`.`name` = 'CHINA'
    ) AS `t0`
    INNER JOIN `dbaas`.`customer` AS `t1` ON `t0`.`nationkey` = `t1`.`nationkey`
    INNER JOIN (
        SELECT
        `t2`.`custkey`
        FROM
        `dbaas`.`orders` AS `t2`
        WHERE
        `t2`.`orderdate` = '1998-08-11'
        GROUP BY
        `t2`.`custkey`
    ) AS `t5` ON `t1`.`custkey` = `t5`.`custkey`
```