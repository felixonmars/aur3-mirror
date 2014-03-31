# Maintainer: Qhor Vertoe <vertoe at qhor dot net>

# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=noirshares-git
_gitname=NoirShares
epoch=1
pkgver=15.1d30737
pkgrel=1
pkgdesc="NoirShares is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://noirbitstalk.org/"
license=('NRS-LICENSE')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('noirshares')
source=('git://github.com/Nameshar/NoirShares.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  mkdir -p "$srcdir/$_gitname/src/obj"
  mkdir -p "$srcdir/$_gitname/build/obj"
  cd "$srcdir/$_gitname"

  # make NoirShares-QT client
  qmake-qt4 NoirShares-qt.pro
  make

  # make NoirSharesd daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix NoirSharesd
}

package() {
  # install NoirShares-QT client
  install -D -m755 "$srcdir/$_gitname/NoirShares-qt" "$pkgdir/usr/bin/NoirShares-qt"

  # install NoirSharesd daemon
  install -D -m755 "$srcdir/$_gitname/src/NoirSharesd" "$pkgdir/usr/bin/NoirSharesd"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

