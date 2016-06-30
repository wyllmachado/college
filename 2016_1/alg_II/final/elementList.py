# coding: utf-8

class Node():
    def __init__(self, d, n = None, p = None):
        self.data = d
        self.next_node = n
        self.prev_node = p
    
    def get_next(self):
        return self.next_node 

    def set_next(self, n):
        self.next_node = n

    def get_prev(self):
        return self.prev_node

    def set_prev(self, p):
        self.prev_node = p

    def get_data(self):
        return self.data

    def set_data(self, d):
        self.data = d
        
