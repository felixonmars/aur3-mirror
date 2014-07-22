# Maintainer: Qhor Vertoe <vertoe at qhor dot net>

# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=cloakcoin-git
_gitname=CloakCoinRelaunch
epoch=1
pkgver=7.9f318b8
pkgrel=1
pkgdesc="Cloakcoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://cloakcoin.org/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('cloakcoin')
source=('git://github.com/CloakCoin/CloakCoinRelaunch.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"

  # make Cloakcoin-QT client
  qmake-qt4 cloakcoin-qt.pro
  make -j $(nproc)

  # make cloakcoind daemon
  cd "$srcdir/$_gitname/src"
  make -j $(nproc) $MAKEFLAGS -f makefile.unix cloakcoind
}

package() {
  # install Cloakcoin-QT client
  install -D -m755 "$srcdir/$_gitname/cloakcoin-qt" "$pkgdir/usr/bin/cloakcoin-qt"

  # install cloakcoind daemon
  install -D -m755 "$srcdir/$_gitname/src/cloakcoind" "$pkgdir/usr/bin/cloakcoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

