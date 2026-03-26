if status is-interactive
  if type -q zoxide
    zoxide init fish | source
  end

  if type -q starship
    and string match -eq /dev/pts (tty)
    starship init fish | source
  end

  if type -q fzf
    fzf --fish | source
  end
end

set -gx fish_greeting

if command -sq vivid
  set -gx LS_COLORS (command vivid generate dracula)
end

set -gx EDITOR nvim
