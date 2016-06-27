#!/usr/bin/env python
# coding: utf-8


class Door():
    def __init__(self):
        self.isClosed = False
        self.isLocked = False
        self.connection = ['block1', 'block2']
    

    # SETTERS
    def setCloseedOrOpenedDoor(self, status):
        if status == 'open' and not self.isLocked:
            self.isClosed = False
        elif status == 'open' and self.isLocked:
            print 'Destranque a porta para poder abrir'
        else:
            self.isClosed = True
    
    def setStatusKey(self, status):
        if status == 'lock' and self.isClosed:
            self.isLocked = True
        elif status == 'lock' and not self.isClosed:
            print 'Feche a porta para poder tranca-la'
        elif status == 'unlock' and self.isLocked:
            self.isLocked = False

    def setDoorConnection(self, arrConc):
        self.connection[0] = arrConc[0]
        self.connection[1] = arrConc[1]

    
    # GETTERS
    def getCloseedOrOpenedDoor(self):
        return self.isClosed

    def getStatusKey(self):
        return self.isLocked

    def getDoorConnection(self):
        return self.connection


if __name__ == '__main__':
    door = Door()

