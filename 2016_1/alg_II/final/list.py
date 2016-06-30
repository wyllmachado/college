# coding: utf-8

from elementList import Node

class LinkedList():
    def __init__(self):
        self.head = None
        self.tail = None
        self.root = None
        self.size = 0

    def get_size(self):
        return self.size

    def add(self, d):
        new_node = Node(d, self.root)
        if self.size == 0:
            self.head = new_node
            self.tail = new_node
        elif self.head.next_node == None and self.tail.prev_node == None:
            self.tail = new_node
            self.tail.prev_node = self.head
            self.head.next_node = self.tail
        else:
            self.root = self.tail
            self.tail = new_node
            self.tail.set_prev(self.root)
            self.root.set_next(self.tail)
        self.size += 1
   
    def remove(self, d):
        this_node = self.find(d)
        nxt = this_node.get_next()
        prv = this_node.get_prev()

        if nxt == None:
            prv.set_next(None)
            self.tail = prv
        elif prv == None:
            nxt.set_prev(None)
            self.head = nxt
        else:
            nxt.set_prev(nxt)
            prv.set_next(prv)

    def find(self, d):
        this_node = self.head
        while this_node:
            if this_node.get_data()['label'] == d['label']:
                return this_node
            else:
                this_node = this_node.get_next()
        return None
