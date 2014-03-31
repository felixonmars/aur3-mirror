# Maintainer: Qhor Vertoe <vertoe at qhor dot net>

# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=tittiecoin-git
_gitname=tittiecoin
epoch=1
pkgver=1.30bfc76
pkgrel=1
pkgdesc="TittieCoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://www.tittiecoin.com/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('tittiecoin')
source=('git://github.com/tittiecoin/tittiecoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"

  # make TittieCoin-QT client
  qmake-qt4 tittiecoin-qt.pro
  make

  # make TittieCoind daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix TittieCoind
}

package() {
  # install TittieCoin-QT client
  install -D -m755 "$srcdir/$_gitname/tittiecoin-qt" "$pkgdir/usr/bin/tittiecoin-qt"

  # install TittieCoind daemon
  install -D -m755 "$srcdir/$_gitname/src/TittieCoind" "$pkgdir/usr/bin/TittieCoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

