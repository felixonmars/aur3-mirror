# Maintainer: Qhor Vertoe <vertoe at qhor dot net>
# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=cachecoin-git
_gitname=cachecoin
epoch=1
pkgver=126.39fdf12
pkgrel=1
pkgdesc="Cachecoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://cach.co/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('cachecoin')
source=('git://github.com/vertoe/cachecoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"

  # make cachecoin-qt client
  qmake-qt4 cachecoin-qt.pro
  make $MAKEFLAGS

  # make cachecoind daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix cachecoind
}

package() {
  # install cachecoin-qt client
  install -D -m755 "$srcdir/$_gitname/cachecoin-qt" "$pkgdir/usr/bin/cachecoin-qt"

  # install cachecoind daemon
  install -D -m755 "$srcdir/$_gitname/src/cachecoind" "$pkgdir/usr/bin/cachecoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install shortcut
  install -D -m644 "$srcdir/$_gitname/src/qt/res/icons/novacoin-128.png" "$pkgdir/usr/share/pixmaps/cachecoin128.png"
  install -D -m644 "$srcdir/$_gitname/contrib/debian/cachecoin-qt.desktop" "$pkgdir/usr/share/applications/cachecoin-qt.desktop"
}

