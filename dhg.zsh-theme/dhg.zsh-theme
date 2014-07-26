# Check if 
local SESSION_TYPE=
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote;;
  esac
fi

# Colors
local _c_reset="$reset_color"
local _c_separator="$fg_bold[black]"
local _c_user="$fg_bold[green]"
local _c_user_root="$fg_bold[cyan]"
local _c_host="$fg_bold[yellow]"
local _c_path="$fg_bold[blue]"
local _c_remote="$fg[cyan]"
local _c_git_branch="$fg_bold[magenta]"
local _c_git_dirty="$fg_bold[cyan]"
local _c_prompt="$fg_bold[white]"


# Prompt separator
local _p_separator='  '

# User prompt
local _p_user="%n%{$_c_separator%}$_p_separator"
if [ $(id -u) -eq 0 ]; then
  local _p_user="%{$_c_user_root%}$_p_user"
else
  local _p_user="%{$_c_user%}$_p_user"
fi

# Host prompt
local _p_host=
if [ -z "$DHG_ZSH_THEME_HIDE_LOCAL_HOST" ] || [ "$SESSION_TYPE" = remote ]; then
  _p_host="%{$_c_host%}%m%{$_c_separator%}$_p_separator"
fi

# Path prompt
local _p_path="%{$_c_path%}%~%{$_c_separator%}$_p_separator"


local _p_status="%(?::
%{$fg_bold[red]%}%?%s)"
local _p_dollar="$(if [ "$UID" -eq "0" ]; then echo '#'; else echo '$'; fi)"

PROMPT='$_p_status
$_p_user$_p_host$_p_path$(git_prompt_info)
%{$_c_prompt%}$_p_dollar %{$_c_reset%}'

RPROMPT="$RPROMPT%{$_c_reset%}"

# Git plugin configuration
ZSH_THEME_GIT_PROMPT_PREFIX="%{$_c_git_branch%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$_c_reset%}$_p_separator"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$_c_git_dirty%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
