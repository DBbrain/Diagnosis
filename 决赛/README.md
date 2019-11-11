决赛题准备工作
1、需要准备一台CVM实例（云服务器）

2、需要准备一台CDB实例（云数据库MySQL) 建议使用腾讯云，云数据库MySQL，可以通过实时诊断信息查看自己SQL优化的情况

3、将data目录通过FTP上传到自己准备的服务器上(例如：您使用的root账号)。

4、将data目录中的数据导入到自己准备的MySQL数据库中，由于数据量大建议使用命令导入。
可以通过服务器连接MySQL，命令：

mysql -h xx(ip) -P xx(端口) -u xx(用户名) -p xx(密码)

登录成功后执行命令(此步骤会耗费时间请等待)：

   1、create database dbaas character set utf8; //创建库
   
   2、use dbaas; //选择库
   
   3、source /root/data/customer.dat 
   
   4、source /root/data/nation.dat 
   
   5、source /root/data/orders.dat
   
   6、source /root/data/region.dat


############################################原表结构#################################################

    create table region  (
        regionkey  integer not null,
        name       varchar(25) not null,
        comment    varchar(152),
        primary key(regionkey)
    );

    create table nation  (
        nationkey  integer not null,
        name       varchar(25) not null,
        regionkey  integer not null,
        comment    varchar(152),
        primary key(nationkey)
    );

    create table customer (
        custkey     integer not null,
        name        varchar(25) CHARACTER SET utf8 COLLATE utf8_bin not null,
        address     varchar(40) not null,
        nationkey   integer not null,
        phone       varchar(15) not null,
        acctbal     decimal(15,2)   not null,
        mktsegment  varchar(10) not null,
        comment     varchar(117) not null,
        primary key(custkey)
    );

    create table orders  (
        orderkey       integer not null,
        custkey        integer not null,
        orderstatus    varchar(1) not null,
        totalprice     decimal(15,2) not null,
        orderdate      date not null,
        orderpriority  varchar(15) not null,  
        clerk          varchar(15) not null, 
        shippriority   integer not null,
        comment        varchar(79) not null,
        primary key(orderkey)
    );


########################待优化SQL语句######################################################

###select1语句


select c.custkey, c.phone, sum(o.totalprice) totalprice
from nation n
inner join customer c on c.nationkey = n.nationkey
inner join orders o on o.clerk = c.name
where n.name = "CHINA" and c.mktsegment = "HOUSEHOLD" and c.phone like "28-520%"
group by c.custkey, c.phone


###select2

select *
from (
    select custkey, orderdate, sum(totalprice) as totalprice
    from orders
    group by custkey, orderdate
) o
where orderdate = "2019-08-01"


###select3

select c.custkey, sum(o.totalprice) totalprice
from customer c
left join orders o on o.custkey = c.custkey
where c.phone like "33-64%" and c.name like concat("Customer#00003", "%")
group by c.custkey


###select4

select c.custkey, c.phone
from nation n
inner join customer c on c.nationkey = n.nationkey
where n.name = "CHINA" and exists (
    select 1 from orders o where o.custkey = c.custkey and o.orderdate = "1998-08-11"
)


