set -xv
cfg () {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
if [[ ! -d $HOME/.cfg ]]; then
 git clone --bare https://github.com/iladin/dotty.git   $HOME/.cfg
 mkdir -p .config-backup
 cfg checkout
 if [ $? = 0 ]; then
   echo "Checked out config.";
   else
     echo "Backing up pre-existing dot files.";
     cfg checkout 2>&1 | egrep "\s+\." | awk '$1=$1' | while read -r file; do
     test -L "$HOME/$file" && unlink "$HOME/$file" || mv "$HOME/$file" "$HOME/.config-backup/$file"
   done
 fi;
 cfg checkout
 cfg config status.showUntrackedFiles no
 fi
 set +xv
