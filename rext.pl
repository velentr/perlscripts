#!/usr/bin/perl

($old, $new) = @ARGV;
foreach (glob "*.$old") {
    ($newfile = $_) =~ s/\.$old$/.$new/;
    if (-e $newfile) {
        warn "re-ext failed: $newfile already exists.\n";
    } elsif (rename $_ => $newfile) {
        # Success!
    } else {
        warn "re-ext failed: $!\n";
    }
}
