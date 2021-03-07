from urllib import request, parse  # , error, robotparser
import ssl
# request 用来发送请求
# error 来进行异常处理
# parse模块就是用来解析我们的 URL 地址的，比如解析域名地址啦，URL指定的目录等
# robotparser 用的就比较少了，它就是用来解析网站的 robot.txt

""" urlopen方法 """
# urllib.request.urlopen(url, data=None, [timeout, ]*)
# urlopen 默认是 Get 请求， 当传入参数它就为 Post 请求
response = request.urlopen('http://www.baidu.com')  # 直接用 Get 请求方式请求百度了
print(response.read().decode('utf-8'),
      file=open('00 练习.html', 'w', encoding='utf8'))

""" request方法 """
# urllib.request.Request(url, data=None, headers={}, method=None)
context = ssl._create_unverified_context()
# 使用 ssl 未经验证的上下文 (https)
url = 'https://biihu.cc//account/ajax/login_process/'
headers = {
    # 假装自己是浏览器
    'User-Agent': ' Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',
}
dict = {
    'return_url': 'https://biihu.cc/',
    'user_name': 'xiaoshuaib@gmail.com',
    'password': '123456789',
    '_post_type': 'ajax',
}
data = bytes(parse.urlencode(dict), 'utf-8')
req = request.Request(url, data=data, headers=headers, method='POST')
response = request.urlopen(req, context=context, timeout=1)
print(response.read().decode('utf-8'))
