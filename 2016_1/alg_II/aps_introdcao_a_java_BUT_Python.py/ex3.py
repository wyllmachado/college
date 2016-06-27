#!/usr/bin/env python
# coding: utf-8

class Ex3():
    def __init__(self):
        self.size = None
        self.color = None
        self.type = None
        self.ilumination = None
    

    # SETTERS
    def setColor(self, c):
        self.color = c

    def setSize(self, x):
        self.size = x

    def setType(self, t):
        self.type = t

    def setIlumination(self, status):
        if status == 'on':
            self.ilumination = True
        else:
            self.ilumination = False

    # GETTTERS
    def getColor(self):
        return self.color

    def getSize(self):
        return self.size

    def getType(self):
        return self.type

    def getIlumination(self):
        return self.ilumination


if __name__ == '__main__':
    room = Ex3()

    room.setType('room')
    room.setColor('black')
    room.setSize('10 x 10')
    room.setIlumination('on') 

    print room.getType()
    print room.getColor()
    print room.getSize()
    print room.getIlumination()
