pkgname=silkcoin-git
_gitname=silkcoin
epoch=1
pkgver=bf2cdefeb6
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency (git version)"
arch=('i686' 'x86_64')
url="http://www.silk-coin.com/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('silkcoin')
conflicts=('silkcoin')
source=('git://github.com/shnurf/silkcoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"

  # check out specific branch or tag
  # git checkout v0.8.6.1
  chmod 755 src/leveldb/build_detect_platform
  # make slikcoin-qt client
  qmake-qt4
  make

  # make slikcoin daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix litecoind
}

package() {
  # install silkcoin-qt client
  install -D -m755 "$srcdir/$_gitname/litecoin-qt" "$pkgdir/usr/bin/litecoin-qt"

  # install silkcoin daemon
  install -D -m755 "$srcdir/$_gitname/src/litecoind" "$pkgdir/usr/bin/litecoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

