import redis
client = redis.Redis(
    host='1.2.3.4',
    port=6379,
    password='mima'
)
client.set('username', 'admin')
client.hset('student', 'name', 'hao')
client.hser('student', 'age', 18)
client.keys('*')
client.get('username')
client.hgetall('student')
