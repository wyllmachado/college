#!/usr/bin/env python
# coding: utf-8


class Lamp(object):
    def __init__(self):
        self.status = False
    

    # GETTER
    def getStatus(self):
        return self.status
    

    # SETTER
    def setStatus(self, status):
        if status == 'on':
            self.status = True
        else:
            self.status = False


if __name__ == '__main__':
    lamp = Lamp()

    lamp.setStatus('on')
    print lamp.getStatus()

    lamp.setStatus('off')
    print lamp.getStatus()
