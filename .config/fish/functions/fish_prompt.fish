function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function fish_prompt
  set -l last_status $status

  set -l normal (set_color normal)
  set -l blue (set_color blue)
  set -l cyan (set_color cyan)
  set -l green (set_color green)
  set -l magenta (set_color magenta)
  set -l purple (set_color purple)
  set -l red (set_color red)
  set -l yellow (set_color yellow)

  set -l cwd $cyan(pwd | sed "s:^$HOME:~:")
  set -l prefix '$ ' $normal

  # fish git prompt settings
  set -g __fish_git_prompt_char_dirtystate '+'
  set -g __fish_git_prompt_char_stagedstate '•'
  set -g __fish_git_prompt_char_stateseparator '|'
  set -g __fish_git_prompt_color_branch yellow
  set -g __fish_git_prompt_color_upstream_ahead green
  set -g __fish_git_prompt_color_upstream_behind red
  set -g __fish_git_prompt_hide_untrackedfiles 1
  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showcolorhints 1
  set -g __fish_git_prompt_showdirtystate 'yes'
  set -g __fish_git_prompt_showstashstate 'yes'
  set -g __fish_git_prompt_showuntrackedfiles 'yes'
  set -g __fish_git_prompt_showupstream 'informative'

  # new line before each prompt
  echo

  # show ssh status
  if [ -n "$SSH_CONNECTION" ]
    echo -ns $red '(ssh) ' $normal
  end

  # show user and host
  echo -ns $green (whoami) '@' (hostname) $normal

  # show git info
  if [ (_git_branch_name) ]
    __fish_git_prompt ' ❮%s⟫'
  end

  # show current working directory
  echo -ns $normal' : '(pwd | sed "s:^$HOME:~:")

  # new line after main line
  echo

  # show last exit status
  echo -ns $normal '['
  if [ $last_status -ne 0 ]
    echo -ns $red
  end
  echo -ns $last_status
  echo -ns $normal ']'

  # show prefix
  echo -ns ' $ '
end
