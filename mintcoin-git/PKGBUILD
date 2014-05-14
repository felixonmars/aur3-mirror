# Maintainer: Qhor Vertoe <vertoe at qhor dot net>

# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=mintcoin-git
_gitname=mintcoin
epoch=1
pkgver=43.7b3152b
pkgrel=1
pkgdesc="Mintcoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://mintcoin.org/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4' 'dos2unix')
provides=('mintcoin')
source=('git://github.com/mintcoinproject/mintcoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  dos2unix "$srcdir/$_gitname/share/genbuild.sh"

  # make Mintcoin-QT client
  qmake-qt4 mintcoin-qt.pro
  make

  # make mintcoind daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix mintcoind
}

package() {
  # install Mintcoin-QT client
  install -D -m755 "$srcdir/$_gitname/mintcoin-qt" "$pkgdir/usr/bin/mintcoin-qt"

  # install mintcoind daemon
  install -D -m755 "$srcdir/$_gitname/src/mintcoind" "$pkgdir/usr/bin/mintcoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

