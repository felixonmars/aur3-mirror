pkgname=msn-pecan-git
pkgver=20110922
pkgrel=1
pkgdesc="msn-pecan is an improved MSN plug-in for Pidgin."
arch=('i686' 'x86_64')
url="http://code.google.com/p/msn-pecan/"
license=('GPL')
provides=('msn-pecan')
conflicts=('msn-pecan')
makedepends=('git')
depends=('libpurple')

_gitroot="git://github.com/felipec/msn-pecan.git"
_gitname="msn-pecan"

build() {

  cd $srcdir
  msg "Connectiong to GIT server..."

  if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
  else
        git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  make DESTDIR="$pkgdir" install_locales || return 1

  rm -rf $srcdir/$_gitname-build

}
