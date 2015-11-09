# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

# Change the window title of X terminals 
case $TERM in
        xterm*|rxvt*|Eterm)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
                ;;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
                ;;
esac
COLOR_RED="\[\e[31;40m\]"
COLOR_GREEN="\[\e[32;40m\]"
COLOR_YELLOW="\[\e[33;40m\]"
COLOR_BLUE="\[\e[34;40m\]"
COLOR_MAGENTA="\[\e[35;40m\]"
COLOR_CYAN="\[\e[36;40m\]"

COLOR_RED_BOLD="\[\e[31;1m\]"
COLOR_GREEN_BOLD="\[\e[32;1m\]"
COLOR_YELLOW_BOLD="\[\e[33;1m\]"
COLOR_BLUE_BOLD="\[\e[34;1m\]"
COLOR_MAGENTA_BOLD="\[\e[35;1m\]"
COLOR_CYAN_BOLD="\[\e[36;1m\]"

COLOR_NONE="\[\e[0m\]"

getBranch()
{
    branch=`hg branch 2>&1`
    if [ $? -eq 0 ]; then
	branch=`python -c "m='$branch'; print (len(m) > 10) and m[:4]+'..'+m[-4:] or m"`
        echo "${COLOR_MAGENTA_BOLD}$branch${COLOR_YELLOW}::${COLOR_NONE}"
    fi
}

promptFunc()
{
    PREV_RET_VAL=$?;

    PS1=""

    if test `whoami` != "root"
    then
        PS1="${PS1}${COLOR_GREEN_BOLD}\u"
    else
        PS1="${PS1}${COLOR_RED_BOLD}\u"
    fi
    
    BRANCH=$(getBranch)

    PS1="${PS1}@\h $BRANCH${COLOR_BLUE_BOLD}\W "

    if test $PREV_RET_VAL -eq 0
    then
        PS1="${PS1}${COLOR_NONE}${COLOR_BLUE_BOLD}> ${COLOR_NONE}"
    else
        PS1="${PS1}${COLOR_NONE}${COLOR_RED_BOLD}${PREV_RET_VAL}${COLOR_BLUE_BOLD}> ${COLOR_NONE}"
    fi
}

PROMPT_COMMAND=promptFunc

#aliases
alias 'ls=ls --color'
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
alias "nicexterm=xterm -fa Monospace -fs 9 -rv"
alias 'sshvoipservers=multixterm -xa "xterm -fa Monospace -fs 9 -rv" -xc "ssh andi.miller@%n.gradwell.com" v-sip-out-1 v-sip-out-2 v-sip-out-3 v-sip-out neo.voip morpheus.voip trinity.voip ford.voip v-sip-in-1 v-sip-in-2 v-sip-in-3 v-sip-trunk-out-1 v-sip-trunk-out-2'
alias 'shelldap=shelldap --binddn=uid=andi.miller,ou=People,dc=gradwell,dc=com  --server '
#packaging
DEBEMAIL="andi.miller@gradwell.com"
DEBFULLNAME="Andi Miller"
export DEBEMAIL DEBFULLNAME
