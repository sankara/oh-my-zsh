# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

export APIKEY=8c1f05fd77243c45
now()
{
    date +%s
}


weather()
{
    poll_every=3600
    cliww="~/bin/weather.py -z 94102"
    if ! [ -e ~/.weather ];
    then
        eval ${cliww} > ~/.weather
    else
      last_run=$(stat -f %c ~/.weather)
    fi

  if [ $(( $last_run + $poll_every )) -lt $(now) ];
    then
        res=$(eval ${cliww})
        if [ $? -eq 0 ];
        then
            echo ${res} > ~/.weather
        fi
  fi

  cat ~/.weather
}


ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}⚡ %{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K{black}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{black}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%{%K{black}%}$(_prompt_char)%{%K{black}%} %#%{%f%k%b%} '

#RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
RPROMPT='%{$fg[red]%}«%{$reset_color%} $(weather) %F{blue} %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'
