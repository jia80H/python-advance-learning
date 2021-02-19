import json
import logging
import requests
import time
import random
import datetime

logger = logging.getLogger()
logger.setLevel(logging.INFO)

# 日检日报提交后字典的参数，返回中文


def get_status1(self):
    if self['code'] == 0:
        return "日检日报成功"
    elif self['code'] == 1:
        return "日检日报打卡时间结束"
    elif self['code'] == -10:
        return "Token已失效"
    else:
        return "发生未知错误"


# 健康打卡提交后字典的参数，返回中文
def get_status2(self):
    if self['code'] == 0:
        return "健康打卡成功"
    elif self['code'] == 1:
        return "健康打卡时间结束"
    elif self['code'] == -10:
        return "Token已失效"
    else:
        return "发生未知错误"


class Xiao:
    def __init__(self):
        # Token 列表
        self.tokenArray = ["XXXXXXXXXXXXXXXXXXXX"]
        self.tokenName = ["小明"]

        # 喵提醒通知
        self.notifytoken = 'XXXXXX'
        self.api1 = "https://student.wozaixiaoyuan.com/heat/save.json"  # 日检日报 提交地址
        self.api2 = "https://student.wozaixiaoyuan.com/health/save.json"  # 健康打卡 提交地址
        self.headers = {
            "Host": "student.wozaixiaoyuan.com",
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept-Encoding": "gzip, deflate, br",
            "Connection": "keep-alive",
            "User-Agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36 MicroMessenger/7.0.9.501 NetType/WIFI MiniProgramEnv/Windows WindowsWechat",
            "Referer": "https://servicewechat.com/wxce6d08f781975d91/147/page-frame.html",
            "token": "",
            "Content-Length": "360",
        }
        # 日检日报数据
        self.data1 = {
            "answers": '["0"]',
            "seq": self.get_seq(),
            "temperature": self.get_random_temprature(),
            "latitude": "10.0000000000",  # 维度
            "longitude": "100.0000000000",  # 经度
            "country": "中国",
            "city": "某某市",
            "district": "某某区",
            "province": "某某省",
            "township": "某某街道",
            "street": "某某路",
        }
        # 健康打卡数据
        self.data2 = {
            "answers": '["0"]',
            "latitude": "10.0000000000",  # 维度
            "longitude": "100.0000000000",  # 经度
            "country": "中国",
            "city": "某某市",
            "district": "某某区",
            "province": "某某省",
            "township": "某某街道",
            "street": "某某路",
        }

    # 获取随机体温
    def get_random_temprature(self):
        random.seed(time.ctime())
        return "{:.1f}".format(random.uniform(36.2, 36.7))

    # seq的1,2,3代表着早，中，晚
    def get_seq(self):
        current_hour = datetime.datetime.now()
        current_hour = current_hour.hour + 8
        if 7 <= current_hour <= 8:
            return "1"
        elif 13 <= current_hour < 14:
            return "2"
        elif 19 <= current_hour < 20:
            return "3"
        else:
            return 1

    def run(self):
        num = 0
        for i in self.tokenArray:
            self.headers["token"] = i
            print("Token:" + self.headers["token"])
            print(datetime.datetime.now())
            res1 = requests.post(
                self.api1, headers=self.headers, data=self.data1, ).json()
            time.sleep(1)
            print(res1)
            if self.get_seq() == "2":
                res2 = requests.post(
                    self.api2, headers=self.headers, data=self.data2, ).json()  # 健康打卡提交
                time.sleep(1)
                print(res2)

                msg = {
                    "id": self.notifytoken,
                    "text": "Token" + '\n' + self.tokenName[num] + self.headers["token"] + '\n' + get_status1(res1) + '\n' + get_status2(res2) + '\n',
                    "type": "json"
                }
            else:
                msg = {
                    "id": self.notifytoken,
                    "text": "Token" + '\n' + self.tokenName[num] + self.headers["token"] + '\n' + get_status1(res1) + '\n',
                    "type": "json"
                }
            print(type(msg))
            requests.post("http://miaotixing.com/trigger", data=msg)
            num = num + 1
        return True


if __name__ == "__main__":
    Xiao().run()


def main_handler(event, context):
    logger.info('got event{}'.format(event))
    return Xiao().run()
