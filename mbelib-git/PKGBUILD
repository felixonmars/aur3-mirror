# Maintainer: Janhouse <janis.jansons@janhouse.lv>

pkgname=mbelib-git
pkgver=1.2.4.10
pkgrel=1
pkgdesc="Voice codecs for P25, ProVoice, Half Rate"
arch=('i686' 'x86_64')
url="https://github.com/szechyjs/mbelib"
license=('custom:copyright')
depends=('glibc')
optdepends=()
provides=('mbelib')

_gitname=mbelib
_gitroot="git@github.com:szechyjs/${_gitname}.git"

pkgver () {
  cd "$srcdir"
  if [ -d $_gitname ] ; then
    cd $_gitname
    git describe |sed 's/-[^-]*$//;s/^v//;s/-/./g'
  fi
}


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir"
  if [ -d $_gitname-build ] ; then
    rm -rf "$_gitname-build"
  fi

  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname"
  make

}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install

    cd "$srcdir/$_gitname"
    install -Dm644 mbelib.h "$pkgdir/usr/include/mbelib.h"
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
