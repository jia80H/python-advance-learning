关系
    一对一: 学生表和成绩表
    一对多/多对一: 学生和分组
    多对多: 学生选课

外键
    添加外键
        一对一(用户和用户信息)
            alter table userinfo add constraint fk_user_id foreign key(id) REFERENCES user(id)
        一对多(组与用户)
            alter table 'user' ADD 'gid' int unsigned;
            alter table 'user' add constraint 'fk_group_id' foreign key('gid') REFERENCES 'group'('id');
        多对多(学生选课)
        create TABLE  order_list (
            id int PRIMARY key AUTO_INCREMENT ,
            student_id int,
            class_id int 
        );  --引入第三方表
            alter table 'order_list' add constraint 'fk_uid' foreign key('student_id') REFERENCES user('id');
            alter table 'order_list' add constraint 'fk_pid' foreign key('class_id') REFERENCES class('id');
        
    删除外键
        alter table 'table_name' droup FOREIGN KEY 'fk_name'
