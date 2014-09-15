#!/usr/bin/perl

mkdir 'xkcd' unless (-d 'xkcd');

foreach $i (1..1408) {
    # get the url for the image
    $url = `curl http://xkcd.com/$i/ 2>/dev/null | grep -i 'image url'`;
    $url =~ /(http:.*\.(png|jpg))/;
    $url = $1;

    # download the image
    $img = $1 if $url =~ /comics\/(.*\.(png|jpg))/;
    unless (-e "xkcd/$img") {   # do not download if exists
        `curl -sS '$url' > 'xkcd/$img'`;
        print "$i\n";
    }
}
