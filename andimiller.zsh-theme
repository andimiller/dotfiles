function hg_prompt_info {
    hg prompt --angle-brackets "\
< %{$fg_bold[magenta]%}<branch>%{$reset_color%}>\
</%{$fg_bold[blue]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[red]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

local user='%{$fg_bold[magenta]%}%n@%{$fg_bold[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg_bold[blue]%}%1d%{$reset_color%}'
local return_code='%(?..%{$fg_bold[red]%}[%?]%{$reset_color%})'
local hg_branch='%{$reset_color%}$(hg_prompt_info)%{$reset_color%}'

PROMPT="${user} ${pwd} %{$fg_bold[magenta]%}>%{$reset_color%} "
RPROMPT="${return_code} %{$fg_bold[magenta]%}%{$reset_color%} %{$fg_bold[magenta]%}%21<...<${hg_branch}%<<"
