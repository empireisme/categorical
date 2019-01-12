# -*- coding: utf-8 -*-
"""
Created on Sun Jan 13 01:41:08 2019

@author: User
"""
import numpy as np
import pandas as pd

#url ='https://github.com/empireisme/categorical/blob/master/data.csv'
###
#delimiter="\t"
#df2= pd.read_csv(url,delimiter="\t")
###


df=pd.read_csv('C:\\Users\\User\\Documents\\GitHub\\categorical\\data.csv') 
dfclear=df.dropna()
Y=dfclear['shot_made_flag']
X=dfclear.drop( columns=['shot_made_flag' ,'team_name',"team_id","shot_id"  ])

x1=df.iloc[:,0]
