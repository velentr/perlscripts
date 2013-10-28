#!/usr/bin/perl

while (<>) {
    chomp;
    if (length > 78) {                          # 78 Character lines
        &style_err("line too long");
    } elsif (/\t/) {                            # No tab characters
        &style_err("don't use tabs");
    } elsif (/,\S/) {                           # Space after comma
        &style_err("put space after comma");
    } elsif (/\/\*\S/) {                        # Space after open comment
        &style_err("put space after open comment");
    } elsif (/\S\*\//) {                        # Space before close comment
        &style_err("put space before close comment");
    } elsif (/\){/) {                           # Space between blocks
        &style_err("put space between delimiters");
    } elsif (/\/\//) {                          # No C++ comments
        &style_err("don't use C++ comments");
    } elsif (/;\S/) {                           # Space after semicolon
        &style_err("put space after semicolon");
                                                # Whitespace around operators
    } elsif (/\w(\+|\-|\*|\/|<=?|>=?|==?|!=|\|\|?|\&\&?|\^)\w/) {
        &style_err("need whitespace around operator");
    } elsif (/\s\Z/) {                          # No trailing whitespace
        &style_err("delete trailing whitespace");
    }
} continue {
    close ARGV if eof;
}

sub style_err
{
    my ($err) = @_;
    print "File $ARGV, Line $.: $err.\n\t$_\n\n";
}
