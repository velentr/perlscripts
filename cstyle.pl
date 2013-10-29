#!/usr/bin/perl

while (<>) {
    chomp;
    &style_err("line too long") if length > 78;
    &style_err("don't use tabs") if /\t/;
    &style_err("put space after comma") if /,\S/;
    &style_err("put space after open comment") if /\/\*\S/;
    &style_err("put space before close comment") if /\S\*\//;
    &style_err("put space between delimiters") if /\)\{/;
    &style_err("don't use C++ comments") if /\/\//;
    &style_err("put space after semicolon") if /;\S/;
    &style_err("need whitespace around operator")
            if /\w(\+|\-|\*|\/|<=?|>=?|==?|!=|\|\|?|\&\&?|\^)\w/;
    &style_err("delete trailing whitespace") if /\s\Z/;
} continue {
    close ARGV if eof;
}

sub style_err
{
    my ($err) = @_;
    print "File $ARGV, Line $.: $err.\n\t$_\n\n";
}
