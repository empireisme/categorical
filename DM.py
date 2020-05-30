# -*- coding: utf-8 -*-
"""
Created on Sun Jan 13 01:41:08 2019

@author: User
"""
import numpy as np
import pandas as pd
%env KERAS_BACKEND=tensorflow
from keras.models import Sequential
from keras.layers import Dense, Activation
from keras.utils import to_categorical

#url ='https://github.com/empireisme/categorical/blob/master/data.csv'
###
#delimiter="\t"
#df2= pd.read_csv(url,delimiter="\t")
###


df=pd.read_csv('C:\\Users\\User\\Documents\\GitHub\\categorical\\data.csv') 
dfclear=df.dropna()
Y=dfclear['shot_made_flag']
X=dfclear.drop( columns=['shot_made_flag' ,'team_name',"team_id","shot_id","game_event_id"  ])
y_binary = to_categorical(Y)
Xnumerical=X.drop(  
columns=["action_type","combined_shot_type",'season','game_id','shot_type',"shot_zone_area",
"shot_zone_basic","shot_zone_range","game_date","matchup",'opponent'])

X1=pd.get_dummies(X )

# 建立簡單的線性執行的模型
model = Sequential()
# Add Input layer, 隱藏層(hidden layer) 有 256個輸出變數
model.add(Dense(units=256, input_dim=9, kernel_initializer='normal', activation='relu')) 
# Add output layer
model.add(Dense(units=2, kernel_initializer='normal', activation='softmax'))
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy']) 
train_history = model.fit(x=Xnumerical, y=y_binary, validation_split=0.2, epochs=10, batch_size=800,
                          verbose=2)  


