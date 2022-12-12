import re
from time import sleep
from typing import KeysView
from selenium import webdriver
import webbrowser
import os


filename="1616.html"



driver=webdriver.Chrome()
str=input("请输入:")
driver.get('file:///D:/QQ/1147118295/FileRecv/1616.html')
blank=driver.find_element_by_xpath("/html/body/div[1]/input")
blank.click()
blank.clear()
blank.click()
blank.send_keys(str)
sleep(2)
driver.find_element_by_id("btn").click()
hextext=driver.find_element_by_id("wrap")
print(hextext.text)
hex_all=re.findall(r".*16进制:(.*)2进制",hextext.text,re.S)
print(''.join(hex_all))
hex=hex_all[0].splitlines()
print(len(hex))
f=open('hexnum.txt','w')
for i in range(1,17):
    f.write(hex[i])
    f.write('\n')
f.close()
driver.close()
