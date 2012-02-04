# Contributor: Piotrek Grzeszczak <thepiotrekg@archlinux.us>
pkgname=qtlogout
pkgver=20110626
pkgrel=1
pkgdesc="Qt exit app for openbox, compiz, pekwm, etc."
arch=('i686' 'x86_64')
url="http://thepierre.dyndns.info"
license=('GPL3')
depends=('qt')
makedepends=('git')
provides=('qtlogout')

_gitroot="git://github.com/piotrek91666/qtLogout.git"
_gitname="qtLogout"

build() {
  cd "$srcdir"

  msg2 "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull )
  else
    git clone $_gitroot $_gitname
  fi
  
  cd "$_gitname"

  msg2 "Starting make..."
  qmake "INSTALL_PREFIX=/usr"
  make
}

package() {
  cd "$srcdir/$_gitname"
  msg2 "Packing..."
  make "INSTALL_ROOT=$pkgdir" install
}
