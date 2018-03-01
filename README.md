# dotfiles

* Installation
```
make
```

* Include the gitconfig file in `~/.gitconfig`:
```
[include]
	path = ~/dotfiles/gitconfig
...
```
This way your local changes won't overwrite the file when you use:
```
git config --global user.name "James Bond"
git config --global user.email "jb@example.com"
