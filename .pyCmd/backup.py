#!/usr/bin/env python

import os
import sys
import re


def isPathIgnore(path):
    ignoreDirs = ['.git', '.backup']

    for dir in ignoreDirs:
        if dir in path:
            return True;
        # end if:
    # end for
    return False;


def main():
    curDir = os.getcwd()
    for root, dirs, files in os.walk(curDir):
        backupDir = os.path.join(root, '.backup')
        if not(os.path.exists(backupDir) and os.path.isdir(backupDir)):
            if (not isPathIgnore(root)):
                os.makedirs(backupDir)
            # end if:
        # end if:
    #end for root, dirs, files in os.walk(curDir):
            

if __name__ == '__main__':
    main()
