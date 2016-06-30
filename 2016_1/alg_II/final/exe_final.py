#!/usr/bin/env python
# coding: utf-8

from list import LinkedList

a = LinkedList()
a.add({
    'label': 'a1',
    'value': '5'
})
a.add({
    'label': 'a2',
    'value': '8'
})
a.add({
    'label': 'a3',
    'value': '10'
})

print a.find({'label': 'a1'}).get_data()
a.remove({'label': 'a1'})
print a.find({'label': 'a2'}).get_prev()
