插入的值是否可以为空
    null: 可以为空, 默认不写
    not null: 不可以为空,如果插入时某给字段为空会报错

    username varchar(16) not null,
    pwd varchar(16) NULL   

default
    默认值一般和null做搭配
    username varchar(16) default 'admin' not null,
    pwd varchar(16) default 123456









