# coding: utf-8


from elementList import Node


class LinkedList():
    def __init__(self, r = None):
        self.root = r
        self.size = 0

    def get_size(self):
        return self.size

    def add(self, d):
        new_node = Node(d, self.root)
        if self.root:
            self.root.set_prev(new_node)
        self.root = new_node
        self.size += 1

    def remove(self, d):
        this_node = self.root
        while this_node:
            if this_node.get_data()['label'] == d['label']:
                nxt = this_node.get_next()
                prv = this_node.get_prev()
                if nxt:
                    nxt.set_prev(prv)
                if prv:
                    prev.set_next(nxt)
                else:
                    self.root = this_node
                self.size -= 1
                return True
            else:
                self.root = this_node.get_next()
        return False

    def find(self, d):
        this_node = self.root
        while this_node:
            if this_node.get_data()['label'] == d['label']:
                return this_node.get_data()
            else:
                this_node = this_node.get_next()
        return None
