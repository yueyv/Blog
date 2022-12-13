后端：

MVC设计架构

util:工具库

Mode层

​	dao数据持久层,与数据库连接，以及业务规则

view层

​	controller包装了servlet代码，反馈给前端的代码

control层

​	service接收了前端返回的数据，并调用相应的dao和view去完成需求

后端的基本功能

​	crud 

article,comment,user,message（文章，评论，用户（管理员，普通用户），留言

定义一个触发器，logininfo,记录登录时间

注册邮箱。

后端通过servlet接收和发送数据

数据库：classify功能表

effects:报错

systemsetup：app启动时的初始化值



