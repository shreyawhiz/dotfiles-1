if [[ -s $HOME/.zprezto/init.zsh ]]; then
  source $HOME/.zprezto/init.zsh
fi

rezsh() {
  local debug rc_file times start end

  [[ "$@" == "--debug" ]] && debug=1

  times=()

  for rc_file in $HOME/.rc/*.zsh; do
    [[ -v "$debug" ]] && start=`gdate +%s%N`
    source $rc_file
    [[ -v "$debug" ]] && end=`gdate +%s%N`
    [[ -v "$debug" ]] && times+="$( echo "$end - $start" | bc -l ) $rc_file"
  done

  for local_file in $HOME/.local/*.zsh; do
    source $local_file
  done

  [[ -v "$debug" ]] && printf '%s\n' "${times[@]}" | sort -nr
}

rezsh

unset -f __
