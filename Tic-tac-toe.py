# -*- coding: utf-8 -*-
"""
Created on Sat May 30 21:16:15 2020

@author: User
"""
import numpy as np
import random 
"""

Declare a chessboard
"""

chessboard=[0]*9
#reshape chessboard to the 3*3
chessboard[]="O"
#chessboard=chessboard.reshape(3,3)

#chessboard[1][2]=1
#chessboard[1][0]=1
#b=np.where(chessboard == 1)
#chessboard[b]

def findplace(chessboard):
    index=np.where(chessboard == 0)
    x = []
    for item in index:
        x.extend(item)
    return(x)

##this findplace fuction will return legal place to put chess

place=findplace(chessboard)

def putchess(place):
    complace=random.sample(place, 1)
    chessboard[complace]="X"

putchess(place)
chessboard=[0]*9
print ("Please input a number from 0 to 8:")
human=int(input() )
chessboard[human]="O"

display=np.array(chessboard).reshape(3,3)
print(display)
place2=findplace(chessboard)

chessboard





