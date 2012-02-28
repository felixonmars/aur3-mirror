# Maintainer: host_samurai <kuroi_kenshi96 at yahoo dot com>

pkgname=doctorjs
pkgver=20120227
pkgrel=1
pkgdesc="A set of static analysis tools for JavaScript"
arch=('any')
url="http://doctorjs.org/"
license=('MPL' 'GPL2' 'LGPL2.1') 
depends=('nodejs')
makedepends=('git')
provides=('doctorjs')
install=$pkgname.install

_gitroot="https://github.com/mozilla/doctorjs.git"
_gitname="doctorjs"

build() {
  msg "Cloning GIT repo..."

  if [ -d $srcdir/$_gitname ] ; then
    cd $srcdir/$_gitname
    git pull --recurse-submodules origin || return 1
    msg "The local files are updated."
  else
    git clone --recurse-submodules $_gitroot || return 1
    cd $pkgname
  fi

  msg "GIT checkout done"
  # do not modify the user's ~/.profile
  sed -i '/^\secho.*$/,+3D' Makefile
  msg "Running make install..."
}

package() {
  cd $srcdir/$_gitname
  make PREFIX=$pkgdir/usr DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
