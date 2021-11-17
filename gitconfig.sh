git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto

git config --global color.branch.current "yellow reverse"
git config --global color.branch.local "yellow"
git config --global color.branch.remote "green"

git config --global color.diff.meta "yellow bold"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.old "red bold"
git config --global color.diff.new "green bold"

git config --global color.status.added "green"
git config --global color.status.changed "red"
git config --global color.status.untracked "cyan"

git config --global core.editor vim
git config --global core.autocrlf input

git config --global branch.autosetuprebase always

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git config --global alias.dfn "diff master --name-only"

