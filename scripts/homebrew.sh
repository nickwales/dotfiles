#!/usr/bin/env bash

# Check for Homebrew
# Install if not present
if test ! $(which brew); then
    echo "Installing Homebrew 🍺..."
    echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install hashicorp/tap if not present
if test ! $(brew tap | grep "hashicorp/tap"); then 
    echo "Adding HashiCorp tap..."
    brew tap hashicorp/tap
fi

# Install hashicorp/security if not present
if test ! $(brew tap | grep "hashicorp/security"); then 
    echo "Adding HashiCorp/security tap..."
    brew tap hashicorp/security git@github.com:hashicorp/homebrew-security.git
fi

tools=(
    go
)

# rust_bins=(
#     # a better `cat`
#     bat
#     # a better `ls`
#     exa
#     fd
#     # a better `diff`
#     git-delta
#     procs
#     tokei
#     ripgrep
# )

other_bin=(
    fzf
    htop
    jq
    tree
    tmux
    wget
    tldr
    aria2
    ack
    grpcurl
)

gnu_tools=(
    coreutils
    moreutils
    findutils
    gnu-indent
    gnu-getopt
    gnu-sed
    gnu-tar
    gnutls
    gawk
    grep
    stow
    flex
    bison
)

fonts=(
    font-jetbrains-mono
    font-fira-mono
    font-fira-code
    font-fira-mono-nerd-font
)

hashi=(
    consul
    nomad
    hashicorp-boundary-desktop
    vault
    terraform
    doormat-cli 
)

cloud=(
    azure-cli
    awscli
)

kube=(
    kubectl
    helm
)

apps=(
    alacritty
    discord
    spotify
    telegram
    visual-studio-code
#    bartender
    vlc
#    appcleaner
#    docker
#    sf-symbols
#    keka
#    transmission
)

brew install ${tools[@]}
brew install ${gnu_tools[@]}
#brew install ${rust_bins[@]}
brew install ${other_bin[@]}
brew install ${hashi[@]}
brew install ${kube[@]}
brew install ${cloud[@]}

brew tap homebrew/cask-fonts
brew install --cask ${fonts[@]}

brew install --cask --appdir="/Applications" ${apps[@]}

brew cleanup


## Other stuff

# Adding HashiCorp Helm Repo
echo "Adding HashiCorp Helm Repo"
helm repo add hashicorp https://helm.releases.hashicorp.com
