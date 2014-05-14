# Maintainer: Qhor Vertoe <vertoe at qhor dot net>

# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=blitzcoin-git
_gitname=BlitzCoin
epoch=1
pkgver=10.03de662
pkgrel=1
pkgdesc="BlitzCoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://www.blitzcoin.org/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4' 'dos2unix')
provides=('blitzcoin')
source=('git://github.com/blitzcoin/BlitzCoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  dos2unix "$srcdir/$_gitname/share/genbuild.sh"

  # make BlitzCoin-QT client
  qmake-qt4 blitzcoin-qt.pro
  make

  # make BlitzCoind daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix BlitzCoind
}

package() {
  # install BlitzCoin-QT client
  install -D -m755 "$srcdir/$_gitname/blitzcoin-qt" "$pkgdir/usr/bin/blitzcoin-qt"

  # install BlitzCoind daemon
  install -D -m755 "$srcdir/$_gitname/src/BlitzCoind" "$pkgdir/usr/bin/BlitzCoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

