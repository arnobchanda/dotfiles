# dotfiles
Linux Setup 

## Packages needed

### Install Linux packages
```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y gcc git net-tools neofetch build-essential procps curl file
```

### Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install brew packages
```bash
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install fzf
brew install fd
brew install bat
brew install eza
brew install zoxide
brew install git-delta
brew install thefuck
brew install tlrc
```

### Copy .bin and bash aliases to home directory
```bash
cp -r ./.bin ~/.bin
cp ./.bash_aliases ~/.bash_aliases
```

### Update bashrc
Copy the bashrc or add the below lines to the end of existing bashrc
```bash
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin"
eval "$(oh-my-posh init bash --config "$(brew --prefix oh-my-posh)"/themes/amro.omp.json)"
eval "$(thefuck --alias fuck)"
eval "$(zoxide init bash)"

# shellcheck disable=SC1090
source ~/.bin/lscolors.sh
# shellcheck disable=SC1090
source ~/.bin/fzf_setup.sh
# shellcheck disable=SC1090
source ~/.bin/custom_functions.sh
```
### Update gitconfig
Update your `.gitconfig` and then copy it or add the following at the end of your existing `~/.gitconfig`

```ini
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections
    side-by-side = true
    # delta detects terminal colors automatically; set one of these to disable auto-detection
    # dark = true
    # light = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```
