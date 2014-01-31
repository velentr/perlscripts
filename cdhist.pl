#!/usr/bin/perl

# need to convert absolute paths to relative
use Cwd 'abs_path';

my @cdhist;                             # save history in array
my $histfile = "$ENV{HOME}/.cdhist";    # directory of the history file

sub read_cdhist {                       # read the cdhist file
    open HIST, "<", $histfile;
    foreach (<HIST>) {
        chomp;
        push @cdhist, $_;
    }
    close HIST;
}

sub print_cdhist {                      # print the cdhist
    my $i = 0;
    foreach (@cdhist) {
        print "$i: $_\n";
        $i++
    }
}

sub write_cdhist {                      # write the cdhist back to file
    open HIST, ">", $histfile;
    print HIST "$_\n" foreach (@cdhist);
    close HIST;
}

sub add_cdhist {                        # add new dir to cdhist
    (my $newdir) = @_;
    $newdir =~ s/~/$ENV{HOME}/;         # expand '~' and get absolute path
    if (!($newdir =~ /\/.*/)) { $newdir = abs_path($newdir); }
    if (-d $newdir and $newdir ne $ENV{HOME}    # check if directory exists
            and $newdir ne ".." and $newdir ne ".") { # also check for special
        $newdir =~ s/$ENV{HOME}/~/;                   # dirs
        @cdhist = grep { $_ ne $newdir } @cdhist;
        unshift @cdhist, $newdir;
        pop @cdhist if (@cdhist > 10);
    }
}

sub get_cdhist {                        # get specific directory from history
    ($dir = $cdhist[shift @_]) =~ s/~/$ENV{HOME}/;
    print $dir;
}

sub usage {                             # display usage statement
    ($prog = $0) =~ s/\/.*\///;
    print "usage: $prog [goto num] [print] [add dirname]\n";
}

&read_cdhist();
$argc = @ARGV;

if ($argc == 2 and $ARGV[0] eq "goto") {
    &get_cdhist($ARGV[1]);
} elsif ($argc >= 2 and $ARGV[0] eq "add") {
    shift @ARGV;
    &add_cdhist($_) foreach (@ARGV);
    &write_cdhist();
} elsif ($argc == 1 and $ARGV[0] eq "print") {
    &print_cdhist();
} elsif ($argc == 0) {
    &get_cdhist(0);
} else {
    &usage()
}

