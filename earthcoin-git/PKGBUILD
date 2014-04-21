pkgname=earthcoin-git
_gitname=earthcoin
pkgver=20140418
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency (git version)"
arch=('i686' 'x86_64')
url="http://www.getearthcoin.com/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('earthcoin')
source=('git://github.com/earthcoinproject/earthcoin.git')
md5sums=('SKIP')

build() {

  # qt version
  cd "$srcdir/$_gitname"
  qmake-qt4
  make

  # earthcoin daemon
  cd "$srcdir/$_gitname/src"

  make $MAKEFLAGS -f makefile.unix earthcoind

}
package() {
  install -D -m755 "$srcdir/$_gitname/earthcoin-qt" "$pkgdir/usr/bin/earthcoin-qt"
  install -D -m755 "$srcdir/$_gitname/src/earthcoind" "$pkgdir/usr/bin/earthcoind"
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

