#!/usr/bin/env python
# coding: utf-8


class TenNumbers():
    def __init__(self):
        self.userNumbers = []

        print 'Please, digite 10 numbers!'
        print '--------------------------\n'

        for i in range(0, 10):
            keyboardInput = raw_input('Digite a number: ')
            self.userNumbers.append(int(keyboardInput))

    
    def userOrder(self):
        return self.userNumbers


    def userReverseOrder(self):
        reverseOrder = []
        i = 10
        n = self.userNumbers

        while i > 0:
            i -= 1
            reverseOrder.append(n[i])            

        return reverseOrder


    def evenNumber(self):
        evenNumberList = []

        for i in range(0, 10):
            n = self.userNumbers[i]

            if n % 2 == 0:
                evenNumberList.append(n)
        
        return evenNumberList


    def oddNumber(self):
        oddNumberList = []
        
        for i in range(0, 10):
            n = self.userNumbers[i]

            if n % 2 != 0:
                oddNumberList.append(n)

        return oddNumberList


    def gtMedia(self):
        gtMediaList = []
        total = 0
        media = 0
        
        for i in range(0, 10):
            n = self.userNumbers[i]
            total += n

        media = total / 10

        for i in range(0, 10):
            n = self.userNumbers[i]

            if n > media:
                gtMediaList.append(n)

        return gtMediaList


if __name__ == '__main__':
    tenN = TenNumbers()

    print tenN.gtMedia()
   
