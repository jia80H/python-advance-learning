import redis
client = redis.Redis()

client.set('username', 'admin')
client.hset('student', 'name', 'hao')
client.hset('student', 'age', 18)
d = client.keys('*')
e = client.get('username')
f = client.hgetall('student')
print(d, e, f, sep='\n')
