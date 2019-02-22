local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local cf_env_local
if [ ! -z $cf_env ];then
  cf_env_local="%{$fg[gray]%}[%{$reset_color%} %{$fg[cyan]%}$cf_env%{$reset_color%} %{$fg[gray]%}]%{$reset_color%}"
fi
PROMPT='$cf_env_local ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
