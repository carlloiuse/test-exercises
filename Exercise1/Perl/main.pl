#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util 'looks_like_number';

sub print_help {
    print "usage: main.pl [-h] list [list ...]\n\n";
    print "Combine lists of integers to produce a single list in strictly increasing order (sorted and unique).\n\n";
    print "Usage:\npython main.py \"1,2,2,3,5,9,11\" \"2,3,3,3,6\"\n\n";
    print "positional arguments:\n  list\t\tcomma separated integer list e.g. 1,2,3,4,5\n\n";
    print "optional arguments:\n  -h, --help\tshow this help message and exit\n";
}

my @collection;

for my $arg (@ARGV) {
    if ($arg eq "-h" || $arg eq "--help") {
        print_help();
        exit;
    }

    for my $i (split(',', $arg)) {
        if (!looks_like_number $i) {
            print "Error: $i is not a valid integer\n";
            exit;
        }
        $collection[++$#collection] = $i;
    }
}

if (!@collection) {
    print "usage: main.pl [-h] list [list ...]\nmain.pl: error: too few arguments\n";
    exit;
}

my %tmp;
my @set = grep !$tmp{$_}++, @collection;

my @results = join(', ', sort {$a <=> $b} @set);

print "Result: [@results]\n";
