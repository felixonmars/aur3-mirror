# Contributor: Jeremy Newton (Mystro256)
# https://github.com/emesene/emesene-supported-themes

pkgname=emesene-supported-themes
pkgver=20110828
pkgrel=1
pkgdesc="Contains the officially supported themes (from git) for the emesene messenger client"
arch=('any')
url="http://blog.emesene.org/"
license=('GPL')
depends=('emesene')
makedepends=('git')

_gitroot="https://github.com/emesene/emesene-supported-themes.git"
_gitname="emesene-supported-themes"

build() {
  cd "$srcdir"
  msg "Checking git...."
  if [ -d $_gitname ] ; then
    msg "Updating GIT"
    cd $_gitname
    git pull origin master
  else
    msg "Cloning from GIT"
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  # Remove default themes...
  rm -r -f $srcdir/emesene-supported-themes/*/default
  rm -r -f $srcdir/emesene-supported-themes/*/default*
  rm -r -f $srcdir/emesene-supported-themes/conversations/Ravenant.AdiumMessageStyle/
  rm -r -f $srcdir/emesene-supported-themes/conversations/renkoo.AdiumMessageStyle/

  # Copy files
  mkdir -p $startdir/pkg//usr/share/emesene/themes
  cp -r $srcdir/emesene-supported-themes/* $startdir/pkg/usr/share/emesene/themes
} 
