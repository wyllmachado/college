#!/usr/bin/env python
# coding: utf-8

from list import LinkedList

a = LinkedList()
b = LinkedList()




a.addFirst({
    'label': 'a1',
    'value': '5'
})
a.addFirst({
    'label': 'a2',
    'value': '8'
})

findA1 = a.find({'label': 'a1'})
print findA1.get_next()

