## 操作说明
将数据导入到自己准备的MySQL数据库中，由于数据量大建议使用命令导入（假如您的数据在/root/data目录下）

可以通过服务器连接MySQL，命令：
```sql
    mysql -h xx(ip) -P xx(端口) -u xx(用户名) -p xx(密码) 
```
登录成功后执行命令(此步骤会耗费时间请等待)：
```sql
   1、CREATE DATABASE sql_optimization_match; //创建库
   
   2、USE sql_optimization_match; //选择库
   
   3、创建表
   
    CREATE TABLE `order` (
       `id` bigint(20) NOT NULL AUTO_INCREMENT,
       `name` varchar(32) NOT NULL,
       `creator` varchar(24) NOT NULL,
       `price` varchar(64) NOT NULL,
       `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
       `status` tinyint(1) not null,
       PRIMARY KEY (`id`)
     );
     
     CREATE TABLE `order_item` (
       `id` bigint(20) NOT NULL AUTO_INCREMENT,
       `name` varchar(32) NOT NULL,
       `parent` bigint(20) NOT NULL,
       `status` int not null,
       `type` varchar(12) NOT NULL DEFAULT '0',
       `quantity` int not null default 1,
       `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (`id`)
     );
     
     4、source /root/data/data.sql  //数据导入
```

## 原表结构

```sql
    CREATE TABLE `order` (
       `id` bigint(20) NOT NULL AUTO_INCREMENT,
       `name` varchar(32) NOT NULL,
       `creator` varchar(24) NOT NULL,
       `price` varchar(64) NOT NULL,
       `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
       `status` tinyint(1) not null,
       PRIMARY KEY (`id`)
     );
         
     CREATE TABLE `order_item` (
       `id` bigint(20) NOT NULL AUTO_INCREMENT,
       `name` varchar(32) NOT NULL,
       `parent` bigint(20) NOT NULL,
       `status` int not null,
       `type` varchar(12) NOT NULL DEFAULT '0',
       `quantity` int not null default 1,
       `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (`id`)
     );
```

## 待优化SQL语句

### select

```sql
    SELECT *
    FROM   `order` o
           INNER JOIN order_item i ON i.parent = o.id
    ORDER  BY o.status ASC,
              i.update_time DESC
    LIMIT  0, 20
```

### update
```sql
    update `order` set
    create_time = now()
    where id in (
        select parent from order_item where type = 2
    )
```


