#!/usr/bin/env python
# coding: utf-8

from list import LinkedList

userInputExpression = None
userInputCel = None
a = LinkedList()
b = LinkedList()


a.addFirst({
    'label': 'a1',
    'value': '5'
})



'''
while(True):
    userInputCel = raw_input('Where do you want insert? \n')
    userInputExpression = raw_input('Enter a math expression: \n')
    result = None
    if userInputCel[0].lower() == 'a':
        print 'A cedule'
        result = a.find({'label': userInputCel})
        if result == None:
            print 'not'
        else:
            print result.get_data()
    elif userInputCel[0].lower() == 'b':
        print 'B Cedule'

    else:
        print 'Invalid input _l_ \n'
        break
'''
