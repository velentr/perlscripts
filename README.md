# Perlscripts

This repository contains the following simple command line tools written in
perl:

- cdhist    : Keep history of 'cd' directories for quicker access
- cstyle    : Style checker for C code
- regex     : Test out regular expressions
- rext      : Change the file extensions on files

## cdhist

This program keeps track of all the recently used directories so that you can
easily cd into them. If you use zsh (you should definitely be using zsh), then
just source the `cdh.zsh` file in your `.zshrc`.

If you are using bash, switch to zsh. Otherwise, just add the following
functions need to your `.bashrc`:

```sh
alias cdp='cdhist print'
alias cds='cdh_goto'
alias cd='cdh_add'

cdh_goto()
{
    if [ $# == 0 ]; then
        ARG=0;
    else
        ARG=${1};
    fi
    cd `cdhist goto $ARG`
}

cdh_add()
{
    if [ $# != 0 ]; then
        cdhist add $*
    fi
    \cd $*
}
```

Then, `cdp` will print out the last 10 working directories and their labels,
`cds [num]` will go to directory `num` (defaults to `num = 0`), and `cd` will
work as normal while additionally adding directories to your history.

## cstyle

This script quickly checks some simple style rules for C code. It will catch
things like end-of-line whitespace, tab indentations, and spaces around
operators. The style used by this script is my personal style; you might not
like some of the things in it.

## regex

Test regular expressions. Pass it a regular expression as an argument, then
type into `stdin` to check for matches.

## rext

Change file extensions. Wrote this a long time ago because I didn't want to
learn anything new. Should work, but I forget the syntax

## Copyright

Copyright (c) 2013-14 Brian Kubisiak <velentr.rc@gmail.com>

See LICENSE for details.
