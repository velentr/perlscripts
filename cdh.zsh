# cdhist aliases
alias cdp='cdhist print'
alias cds='cdh_goto'

# Call cdh_add whenever the directory is changed
function chpwd() {
    emulate -L zsh
    cdh_add
}

# Goto the given directory from the history
cdh_goto()
{
    if [ $# == 0 ]; then
        ARG=0;
    else
        ARG=${1};
    fi
    cd `cdhist goto $ARG`
}

# Check if the PWD is $HOME before adding it to the histfile
cdh_add()
{
    if [ $PWD != $HOME ]; then
        cdhist add $PWD
    fi
}

