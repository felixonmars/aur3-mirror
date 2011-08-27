# Contributor: Jeremy Newton (Mystro256)
# https://github.com/emesene/emesene-supported-plugins

pkgname=emesene-supported-plugins
pkgver=20110809
pkgrel=2
pkgdesc="Contains the officially supported plugins (from git) for the emesene messenger client"
arch=('any')
url="http://blog.emesene.org/"
license=('GPL')
depends=('emesene>=2.11.7')
makedepends=('git')

_gitroot="https://github.com/emesene/emesene-supported-plugins.git"
_gitname="emesene-supported-plugins"

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

  # Copy files
  mkdir -p $startdir/pkg//usr/share/emesene/plugins
  cp -r $srcdir/emesene-supported-plugins/* $startdir/pkg/usr/share/emesene/plugins
} 
