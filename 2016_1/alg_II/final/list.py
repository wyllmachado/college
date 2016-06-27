# coding: utf-8


from elementList import ElementList


class LinkedList():
    # CONSTRUCTOR
    def __init__(self):
        self.head = None
        self.tail = None
        self.temp = None

    
    # METHODS
    def append(self, label, value):
        element = ElementList(label, value)

        if self.head == None:
            self.head = element
            self.tail = element
            return
        elif self.head.nextEl == None and self.tail.prevEl == None:
            
            return


    def addAfter(self, label, value, after):
        element = ElementList(label, value)

        if self.head == None:
            self.head = element
            self.tail = element
            return


    def addBefore(self, label, value, before):
        element = ElementList(label, value)
        
        if self.head == None:
            self.head = element
            self.tail = element
            return


    def remove(self, who):
        return

 
    # GETTER
    def getHead(self):
        return self.head


    def getTail(self):
        return self.tail


    def getElement(self, name):
        return


# if name == '__main__':
#    return
    
