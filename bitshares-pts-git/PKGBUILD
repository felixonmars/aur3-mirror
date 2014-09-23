# Maintainer: Qhor Vertoe <vertoe at qhor dot net>

# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=bitshares-pts-git
_gitname=BitShares-PTS
pkgver=4100.9e02d4b
pkgrel=1
pkgdesc="Bitshares-PTS (Protoshares) is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://invictus.io/bitshares-pts.php"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('bitshares-pts')
conflicts=('protoshares-qt-git')
source=('git://github.com/BitShares/BitShares-PTS.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"

  # make BitShares-PTS client
  qmake-qt4 bitshares-pts.pro
  make -j $(nproc)

  # make bitshares-ptsd daemon
  cd "$srcdir/$_gitname/src"
  make -j $(nproc) $MAKEFLAGS -f makefile.unix bitshares-ptsd
}

package() {
  # install BitShares-PTS client
  install -D -m755 "$srcdir/$_gitname/BitShares-PTS" "$pkgdir/usr/bin/BitShares-PTS"

  # install bitshares-ptsd daemon
  install -D -m755 "$srcdir/$_gitname/src/bitshares-ptsd" "$pkgdir/usr/bin/bitshares-ptsd"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

