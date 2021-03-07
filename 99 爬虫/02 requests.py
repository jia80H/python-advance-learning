import requests
# pip install requests 下载

""" 基本使用 """
# get请求
r = requests.get('https://api.github.com/events')
# post请求
r = requests.post('https://httpbin.org/post', data={'key': 'value'})
# 其他请求
r = requests.put('https://httpbin.org/put', data={'key': 'value'})
r = requests.delete('https://httpbin.org/delete')
r = requests.head('https://httpbin.org/get')
r = requests.options('https://httpbin.org/get')

# 带参数请求
payload = {'key1': 'value1', 'key2': 'value2'}
r = requests.get('https://httpbin.org/get', params=payload)
# 请求头
url = 'https://api.github.com/some/endpoint'
headers = {'user-agent': 'my-app/0.0.1'}
r = requests.get(url, headers=headers)

""" 回应 """
r = requests.get('https://api.github.com/events')
# 文本内容
print(r.text, file=open('00 练习.py', 'w', encoding='utf8'))
# 字节响应
print(r.content)
# 编码集
print(r.encoding)
# 响应码
print(r.status_code)
# 响应头
print(r.headers)
# json响应内容
print(r.json())
# socket 流响应内容
r = requests.get('https://api.github.com/events', stream=True)
print(r.raw)
print(r.raw.read(10))

""" post """
# 一个键里面添加多个值
payload_tuples = [('key1', 'value1'), ('key1', 'value2')]
r1 = requests.post('https://httpbin.org/post', data=payload_tuples)
payload_dict = {'key1': ['value1', 'value2']}
r2 = requests.post('https://httpbin.org/post', data=payload_dict)
print(r1.text)
# {  ...  "form": {    "key1": [      "value1",      "value2"    ]  },  ...}
print(r1.text == r2.text)
# 用 json 作为参数
url = 'https://api.github.com/some/endpoint'
payload = {'some': 'data'}
r = requests.post(url, json=payload)
# 上传文件
url = 'https://httpbin.org/post'
files = {'file': open('00 练习.py', 'rb')}
r = requests.post(url, files=files)
print(r.text)
# 获取 cookie 信息
url = 'http://example.com/some/cookie/setting/url'
r = requests.get(url)
print(r.cookies['example_cookie_name'])
# example_cookie_value
# 发送 cookie 信息
url = 'https://httpbin.org/cookies'
cookies = dict(cookies_are='working')
r = requests.get(url, cookies=cookies)
print(r.text)
# '{"cookies": {"cookies_are": "working"}}'

# 设置超时
requests.get('https://github.com/', timeout=0.001)
