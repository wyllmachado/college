#!/usr/bin/env python
# coding: utf-8

class HouseBlock():
    def __init__(self):
        self.size = None
        self.color = None
        self.type = None


    # SETTERS
    def setColor(self, c):
        self.color = c

    def setSize(self, x):
        self.size = x

    def setType(self, t):
        self.type = t


    # GETTTERS
    def getColor(self):
        return self.color

    def getSize(self):
        return self.size

    def getType(self):
        return self.type


if __name__ == '__main__':
    room = HouseBlock()

    room.setType('room')
    room.setColor('black')
    room.setSize('10 x 10')

    print room.getType()
    print room.getColor()
    print room.getSize()
