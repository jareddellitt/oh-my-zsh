function get_cwd() {
	echo "${PWD/$HOME/~}"
}

function git_prompt_info() {
   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
   echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function battery_charge() {
    if [ -e ~/bin/batcharge.py ]
    then
        echo `python ~/bin/batcharge.py`
    else
        echo '';
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

PROMPT='$fg[red]%n${reset_color%} at $fg[cyan]%m: $fg[yellow]$(get_cwd) $(git_prompt_info)
$reset_color→ '

RPROMPT='$(battery_charge)'