# Maintainer: Grigorios Bouzakis <grbzks@xsmail.com>
pkgname=cpupowerutils
pkgver=20110314
pkgrel=1
pkgdesc="CPU power utilities"
arch=('i686' 'x86_64')
url="http://gitorious.org/cpupowerutils"
license=('GPL2')
depends=('pciutils')
makedepends=('git')
provides=('cpufrequtils')
conflicts=('cpufrequtils')
options=('!makeflags')

_gitroot="git://gitorious.org/cpupowerutils/cpupowerutils.git"
_gitname="cpupowerutils"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname -b cpupowerutils
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  unset LDFLAGS

  make
}

package() {
  cd $srcdir/$_gitname-build

  unset LDFLAGS

  make INSTALL=/bin/install mandir=/usr/share/man DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
