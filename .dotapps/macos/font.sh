#!/bin/sh
#[ "$OSNAME" = 'macos' ]

FONT_DIR=~/Library/Fonts

[ -e "$FONT_DIR/Source Code Pro for Powerline.otf" ] && [ -e "$FONT_DIR/SauceCodeProNerdFontMono-Medium.ttf" ] && exit 1

# Source Code Pro for Powerline fonts
if [ ! -e "$FONT_DIR/Source Code Pro for Powerline.otf" ]; then
  git clone --depth=1 https://github.com/powerline/fonts.git
  cd fonts
  ./install.sh
  cd -
  rm -rf fonts
fi

# Nerd Fonts
## Sauce Code Pro
if [ ! -e "$FONT_DIR/SauceCodeProNerdFontMono-Medium.ttf" ]; then
  curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.zip
  unzip -d SourceCodePro SourceCodePro.zip
  find SourceCodePro -name '*.[ot]tf' -type f -print0 | xargs -0 -n1 -I % mv "%" "$FONT_DIR/"
	rm -rf SourceCodePro SourceCodePro.zip 
fi
## Space Mono
if [ ! -e "$FONT_DIR/SpaceMonoNerdFont-Regular.ttf" ]; then
  curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SpaceMono.zip
  unzip -d SpaceMono SpaceMono.zip
  find SpaceMono -name '*.[ot]tf' -type f -print0 | xargs -0 -n1 -I % mv "%" "$FONT_DIR/"
  rm -rf SpaceMono SpaceMono.zip
fi
