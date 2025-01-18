function hg_prompt_info {
    hg prompt --angle-brackets "\
< %{$fg_bold[cyan]%}<branch>%{$reset_color%}>\
</%{$fg_bold[blue]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[red]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

local user='%{$fg_bold[cyan]%}%n@%{$fg_bold[cyan]%}%m%{$reset_color%}'
local pwd='%{$fg_bold[blue]%}%1~%{$reset_color%}'
local return_code='%(?..%{$fg_bold[red]%}[%?]%{$reset_color%})'
local hg_branch='%{$reset_color%}$(hg_prompt_info)%{$reset_color%}'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'
function nix_shell() {
    if [[ -n "$IN_NIX_SHELL" ]]; then
        if [[ -n $NIX_SHELL_PACKAGES ]]; then
	    echo "${fg[cyan]%}{ $NIX_SHELL_PACKAGES } "
        fi;
    fi;
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="${user} ${pwd} $(nix_shell)%{$fg_bold[cyan]%}>%{$reset_color%}  "
RPROMPT="${return_code}%{$fg_bold[cyan]%}%{$reset_color%}%{$fg_bold[cyan]%}${git_branch}"
