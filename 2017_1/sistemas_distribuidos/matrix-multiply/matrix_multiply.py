# -*- coding: utf-8 -*-


import sys
import ast


param = sys.argv



if __name__ == '__main__':
    # removing index 0 [this is the path file execution]
    param.remove(param[0])
    
    # converting string to literal list
    mtx1 = ast.literal_eval(param[0])
    mtx2 = ast.literal_eval(param[1])

    count_mtx1 = len(mtx1)
    count_mtx2 = len(mtx2)
    
    print mtx1
    print mtx2

    if(len(mtx1) != len(mtx2))


