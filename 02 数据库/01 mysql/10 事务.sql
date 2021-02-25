语法和使用
    开启事务: BEGIN 或 START TRANSACTION
    提交事务: COMMIT ,提交会让所有修改生效
    回滚: ROLLBACK , 撤销正在进行的所有未提交的修改
    创建保存点: SAVEPOINT identifier
    删除保存点: RELEASE SAVEPOINT identifier
    把事务回滚到保存点: ROLLBACK TO identifier
    查询事务的隔离级别: show variables like '%isolation%' ;
    设置事务的隔离级别: SET [SESSION | GLOBAL] TRANSACTION ISOLATION LEVEL {READ UNCOMITTED |
    READ COMMITTED | REPEATABLE READ | SERIALIZABLE}
    InnoDB提供的隔离级别有
        。READ
        。UNCOMMITTED
        。READ COMMITTED
        。REPEATABLE READ
        。SERIALIZABLE
