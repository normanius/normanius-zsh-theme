# Zsh Theme - based on bira.zsh-theme
# For special expressions like %s or %?, see here:
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/

# Multi-line (showing additional info
local multi_line=true
# Show user/host
local show_user=true
# How to display optional info about git / virtenv / rvm
local status_style="$terminfo[bold]$fg[red]"

if [ "$show_user" = true ] ; then
    if [[ $UID -eq 0 ]]; then
        local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
        local user_symbol='#'
    else
        local user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
        local user_symbol='$'
    fi
else
    # %? checks the return status of the last command
    local user_host='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)'
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local current_dir='%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
# This requires the virtualenv plugin to be activated (see .zshrc).
# Note that virtualenv_conda_prompt_info() is available in a
# modified version of this plugin.
#local venv_prompt='$(virtualenv_prompt_info)'
local venv_prompt='$(virtualenv_conda_prompt_info)'

if [ "$multi_line" = true ] ; then
    PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}
╰─%B${user_symbol}%b "
    RPROMPT="%B${return_code}%b"
else
    PROMPT="${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}"
    RPROMPT=""
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{${status_style}%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{${status_style}%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{${status_style}%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
