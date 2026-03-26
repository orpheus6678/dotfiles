set -l progname vivid
set -l commands generate preview themes help
set -l themes ($progname themes)

function __vivid_help_token
  # get TOKEN in "vivid FLAGS help TOKEN"
  # subtlety: (commandline -pc) != "$(commandline -pxc)"
  # absence of -x (tokens-expanded) keeps unfinished cursor position token 
  # which is particularly undesired in this case

  set -l tokens (string split -m1 -- help "$(commandline -pxc)")
  set tokens (string trim $tokens)
  echo $tokens[-1]
end

complete -c $progname -f 

complete -c $progname -n "not __fish_seen_subcommand_from $commands" -s m -l color-mode -xa '8-bit 24-bit' \
  -d 'ANSI color type (default: 24-bit)'

complete -c $progname -n "not __fish_seen_subcommand_from $commands" -s d -l database -xa '(__fish_complete_directories)' \
  -d 'directory containing filetypes.yml'

complete -c $progname -n "not __fish_seen_subcommand_from $commands" -s V -l version -d 'print version'
complete -c $progname -n 'not __fish_seen_subcommand_from help' -s h -l help -d 'print help'

complete -c $progname -n "not __fish_seen_subcommand_from $commands" -a generate -d 'generate LS_COLORS expression'
complete -c $progname -n "not __fish_seen_subcommand_from $commands" -a preview -d 'preview a given theme'
complete -c $progname -n "not __fish_seen_subcommand_from $commands" -a themes -d 'list available themes'
complete -c $progname -n "not __fish_seen_subcommand_from $commands" -a help -d 'print help or subcommand help'

complete -c vivid -n '__fish_seen_subcommand_from help' \
  -n 'not __fish_seen_subcommand_from (__vivid_help_token)' -a "$commands"

complete -c $progname -n '__fish_seen_subcommand_from generate preview' \
  -n 'not __fish_seen_subcommand_from help' \
  -n "not __fish_seen_subcommand_from $themes" -a "$themes" 
