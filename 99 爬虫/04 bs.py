from bs4 import BeautifulSoup
# pip install beautifulsoup4
# 目标文档
html_doc = """

<html><head><title>学习python的正确姿势</title></head>
<body>
<p class="title"><b>小帅b的故事</b></p>

<p class="story">有一天，小帅b想给大家讲两个笑话
<a href="http://example.com/1" class="sister" id="link1">一个笑话长</a>,
<a href="http://example.com/2" class="sister" id="link2">一个笑话短</a> ,
他问大家，想听长的还是短的？</p>

<p class="story">...</p>

"""
# 将 html 的源代码传给 BeautifulSoup
soup = BeautifulSoup(html_doc, 'lxml')

# 获取标题
print(soup.title.string)
# 学习python的正确姿势

# 获取 p 标签里面的内容
print(soup.p.string)
# 小帅b的故事

# 获取 title 的父级标签
print(soup.title.parent.name)
# head

# 获取超链接
print(soup.a)
# <a class="sister" href="http://example.com/1" id="link1">一个笑话长</a>

# 获取所有超链接
print(soup.find_all('a'))
# [<a class="sister" href="http://example.com/1" id="link1">一个笑话长</a>,
# <a class="sister" href="http://example.com/2" id="link2">一个笑话短</a>]

# 获取 id 为 link2 的超链接
print(soup.find(id="link2"))
# <a class="sister" href="http://example.com/2" id="link2">一个笑话短</a>

# 获取网页中所有的内容
print(soup.get_text())

# (css)使用 select 方法
print(soup.select("title"))
print(soup.select("body a"))
print(soup.select("p > #link1"))
