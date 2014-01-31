pkgname=noblecoin-git
_gitname=NobleCoin
pkgver=20130130
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency (git version)"
arch=('i686' 'x86_64')
url="http://www.noblemovement.com/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('noblecoin')
source=('git://github.com/jlcurby/NobleCoin.git')
md5sums=('SKIP')

build() {

  # qt version
  cd "$srcdir/$_gitname"
  qmake-qt4
  make

  # noblecoin daemon
  cd "$srcdir/$_gitname/src"

  # https://github.com/jlcurby/NobleCoin/issues/2
  mkdir -p obj

  make $MAKEFLAGS -f makefile.unix noblecoind

}
package() {
  install -D -m755 "$srcdir/$_gitname/noblecoin-qt" "$pkgdir/usr/bin/noblecoin-qt"
  install -D -m755 "$srcdir/$_gitname/src/noblecoind" "$pkgdir/usr/bin/noblecoind"
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

