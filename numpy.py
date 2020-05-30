# -*- coding: utf-8 -*-
"""
Created on Mon May 25 21:52:39 2020

@author: User
"""

import numpy as np
import requests
from bs4 import BeautifulSoup

url = "https://www.ptt.cc/bbs/joke/index.html"
for i in range(3): #往上爬3頁
    r = requests.get(url)
    soup = BeautifulSoup(r.text,"html.parser")
    sel = soup.select("div.title a") #標題
    u = soup.select("div.btn-group.btn-group-paging a") #a標籤
    print ("本頁的URL為"+url)
    url = "https://www.ptt.cc"+ u[1]["href"] #上一頁的網址


    
a=[1,32,3 ]
a[0]=2
list=[ ]

a = list("Hellodfgdsgsdg")
a=[0]*5
a[1]=2
a = list("This is a book.")
n = len(a)