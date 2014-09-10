#!/usr/bin/python
import argparse
import sys

parser = argparse.ArgumentParser(description="""
Combine lists of integers to produce a single list in strictly increasing order (sorted and unique).

Usage:
python main.py "1,2,2,3,5,9,11" "2,3,3,3,6"
""".strip(), formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('list', type=str, nargs='+', help="comma separated integer list e.g. 1,2,3,4,5")

collection = []

params = parser.parse_args(sys.argv[1:])
for list_ in params.list:
    for i in list_.split(','):
        try:
            collection.append(int(i.strip()))
        except:
            raise Exception("Error: %s is not a valid integer" % i)

print 'Result: %s' % sorted(set(collection))
