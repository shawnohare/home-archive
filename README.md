## Introduction

User configuration managed through a bare git repo. This avoides having to
explicitly symlink at the cost of wrapping git when dealing with configuration
files. By default an editor might not pick up on git information for files
fetched from the bare repository.

## Initialization

To get the initial configuration files to a new environment run.

```bash
git clone --bare https://github.com/shawnohare/home.git $HOME/.git
cd $HOME/.git
git config --local status.showUntrackedFiles no
git --git-dir=$HOME/.git/ --work-tree=$HOME checkout -f
```

An alternative is to use rsync.
```bash
git clone https://github.com/shawnohare/home.git config.tmp
rsync --recursive --verbose --exclude '.git' config.tmp/ $HOME/
rm -rf config.tmp
```

One benefit of cloning to `~/.git` is that `git` will be able to directly see
history, branch information, etc when not in a non-bare repository.

## Usage

Once the configuration files are installed, a new shell session should have
access to the `conf` executable that, among other things, wraps git.

For example,

```bash
conf git <cmd> [args]
# equivalent to git --git-dir=$HOME/.git work-tree=$HOME <cmd> [args]
```
