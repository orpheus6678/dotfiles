function dfm --wraps='git --git-dir=$HOME/.dotfiles --work-tree=$HOME' --description 'alias dfm=git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
end
