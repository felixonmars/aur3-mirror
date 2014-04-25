# Maintainer: Noel Maersk <veox at wemakethings dotnet>

pkgname=peercoin-git
_gitname=ppcoin
_realname=peercoin
pkgver=0.4.0.r0.g613a559
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency (git version)"
arch=('i686' 'x86_64')
url="http://www.peercoin.net/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('ppcoin' 'peercoin')
conflicts=('ppcoin-daemon' 'ppcoin-qt')
source=('git://github.com/ppcoin/ppcoin.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use tag of the last commit, but removing the prefix,
  # the "ppc" suffix, and substituting dashes with dots
  git describe --long | \
    sed -r 's/^v//;s/([^-]*)ppc-([^-]*-g)/\1-r\2/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  # check out specific branch or tag
  # git checkout v0.3.0

  # make Qt client
  qmake-qt4
  make

  # make daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix ppcoind
}

package() {
  # install Qt client
  install -D -m755 "$srcdir/$_gitname/ppcoin-qt" "$pkgdir/usr/bin/peercoin-qt"

  # install daemon
  install -D -m755 "$srcdir/$_gitname/src/ppcoind" "$pkgdir/usr/bin/peercoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
