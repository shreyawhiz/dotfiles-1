set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

function fish_prompt --description 'Write out the prompt'
  set -l last_status $status
  set -l status_color
  set -l identity (whoami)'@'(hostname)
  set -l git_prompt (__fish_git_prompt "|")
  set -l formatted_path ' : '(pwd | sed "s|$HOME|~|")

  set -g current_branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not test $last_status -eq 0
    set status_color $fish_color_error
  else
    set status_color '--bold green'
  end

  echo

  # current user and hostname
  set_color --bold green
  echo -n $identity

  # git prompt
  set_color normal
  echo -n $git_prompt

  # current working directory
  echo -n $formatted_path

  echo

  # last return status
  echo -n '['
  eval "set_color $status_color"
  echo -n $last_status
  set_color normal
  echo -n ']'

  # all done!
  echo -n ' $ '
end
