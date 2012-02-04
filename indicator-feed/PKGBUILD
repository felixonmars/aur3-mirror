# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=indicator-feed
pkgver=1.01
pkgrel=1
pkgdesc="RSS feed updates indicator"
arch=('i686' 'x86_64')
url="http://code.google.com/p/feedindicator/"
license=('GPL3')
depends=('gtk2>=2.12' 'xdg-utils' 'libnotify' 'indicator-application' 'hicolor-icon-theme' 'libdbusmenu' 'python2>=2.3' 'python-feedparser')
install='indicator-feed.install'
groups=('ayatana')
source=(http://feedindicator.googlecode.com/files/feedindicator-20110208.tar.gz)
md5sums=('fffbddf363825188da5a4ae7ad41ab00')

build() {
  
  # Fix the python shebang
  export PYTHON="/usr/bin/python2"
  sed -i 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' feedindicator.py

  # Create dirs
  mkdir -p $pkgdir/usr/share/feedindicator
  mkdir -p $pkgdir/usr/bin
  
  # Copy app icons and desktop
  cp feedindicator-logo.png $pkgdir/usr/share/feedindicator
  cp feedindicator-icon.png $pkgdir/usr/share/feedindicator
  
  # Copy and fix the executable
  cp feedindicator.py $pkgdir/usr/bin/feedindicator
  chmod +x $pkgdir/usr/bin/feedindicator
  
  # Copy the icons
  cp dark $pkgdir/usr/share/feedindicator -R
  cp light $pkgdir/usr/share/feedindicator -R
  cp hicolor $pkgdir/usr/share/feedindicator -R
  
  
  # Fix the stupidly coded desktop file and move it
  sed -i 's|Exec=python /usr/bin/feedindicator.py|Exec=/usr/bin/feedindicator|' Feedindicator.desktop
  cp Feedindicator.desktop $pkgdir/usr/share/feedindicator
  
}

