""" 会被注入 """
import pymysql
import hashlib

username = input('请输入用户名：')
password = input('请输入密码: ')

# 进行md5加密
h = hashlib.md5()
h.update(password.encode('utf8'))
password = h.hexdigest()

db = pymysql.connect(
    host="localhost",
    user="testuser",
    password="test123",
    database="TESTDB",
    port=3306,
    charset='utf8'
)

cursor = db.cursor()

sql = 'select * from user where name="%s" and password="%s"' % (
    username, password)

cursor.execute(sql)
cursor.close()

print(cursor.fetchone())

""" 改进 """
sql = 'select * from user where name="%s" and password="%s"'
cursor.execute(sql, (username, password))
