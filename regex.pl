#!/usr/bin/perl

$pattern = shift @ARGV;
while (<>) {
    chomp;
    if (m{($pattern)}) {
        print "Matched: |$`<$&>$'|\n";
    } else {
        print "No match: |$_|\n";
    }
}
