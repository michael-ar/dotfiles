# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
brew tap caskroom/cask &&
brew install cask

# install apps
brew cask install visual-studio-code &&
brew cask install google-chrome &&
brew cask install iterm2 &&
brew cask install slack &&
brew cask install docker