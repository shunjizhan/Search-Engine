#!/usr/bin/env python3

import sys
import os
import numpy
import numpy.linalg
import scipy.misc


def getOutputPngName(path, rank):
    filename, ext = os.path.splitext(path)
    return filename + '.' + str(rank) + '.png'


def getOutputNpyName(path, rank):
    filename, ext = os.path.splitext(path)
    return filename + '.' + str(rank) + '.npy'


def k_approximate(m):
    u, s, vh = numpy.linalg.svd(m)
    svd = numpy.zeros(m.shape)
    for i in range(k):
        svd += s[i] * numpy.outer(u.T[i], vh[i])
    return svd


if len(sys.argv) < 3:
    sys.exit('usage: task1.py <PNG inputFile> <rank>')

# read file
filename, k = sys.argv[1], int(sys.argv[2])
img = scipy.misc.imread(filename)

# perform SVD
res = k_approximate(img)

# save the result
numpy.save(getOutputNpyName(filename, k), res)
scipy.misc.imsave(getOutputPngName(filename, k), res)
