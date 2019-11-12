## 腾讯云数据库诊断大赛赛题

报名时间：2019.09.27~2019.10.31

每位参赛者领取到唯一的腾讯云账号，腾讯云将会在账号的云服务器上模拟业务访问，造成每组的 MySQL 云数据库上出现故障、异常、隐患等现象，参赛者需根据云基础监控和日志信息，在不降低业务访问量的情况下，对业务代码或数据库进行优化。<b>腾讯云智能数据库管家 DBbrain 会实时对每个参赛用户的实例进行健康巡检和打分</b>，比赛结束后，按照 DBbrain 的健康打分确定晋级 /排名。如分数相同的，用时最短的参赛者获胜。

## 数据库智能管家DBbrain内测申请
请您在微信公众号中搜索腾讯云数据库进行关注，进入公众号，点击一键管理，点击数据库服务中的 “数据库智能管家DBbrain” 即可申请内测资格

## 数据以及运行程序的获取
由于数据量比较大，请点击下方链接进行下载数据

https://share.weiyun.com/5EUySvz

数据存放在data目录中

运行程序存放在sql_optimization_match目录中

## 决赛题准备工作
#### 注意：避免各种问题，请购买腾讯云的CVM以及CDB，并且购买相同的地域和地区
1、需要准备一台CVM实例（云服务器）

购买步骤：

1）点击该链接：https://cloud.tencent.com/

2）选择左上角菜单->产品->基础->云服务器->立即选购

<img src="./img/cvm1.jpg" />

<img src="./img/cvm2.jpg" />

3）您还可以通过右上角->控制台->左上角云产品->云服务器->新建

<img src="./img/cvm3.jpg" />

<img src="./img/cvm4.jpg" />

2、需要准备一台CDB实例（云数据库MySQL) 请购买腾讯云数据库，云数据库MySQL，可以通过腾讯云智能数据库管家DBbrain查看自己SQL优化的情况。

购买步骤：

1）点击该链接：https://cloud.tencent.com/

2）选择左上角菜单->产品->基础->云数据库MySQL->立即选购

<img src="./img/cdb1.jpg" />

<img src="./img/cdb2.jpg" />

3)您还可以通过右上角->控制台->左上角云产品->云数据库MySQL->新建

<img src="./img/cdb3.jpg" />

<img src="./img/cdb4.jpg" />

#### 建议购买配置：
```sql
地域：请购买和CVM相同的地域（地区）
数据库版本：MySQL5.7
架构：高可用版本
实例规格：1核1000MB
硬盘：25GB
```
3、将数据以及运行程序通过FTP上传到自己准备的服务器上。

4、点击初赛（决赛）目录，获取运行程序并且查看比赛赛题，根据赛题提供的SQL进行优化。