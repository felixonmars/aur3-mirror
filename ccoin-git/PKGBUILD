# Maintainer: Brian Hood <brian6854@googlemail.com>

pkgname=ccoin-git
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc="CCoin is a peer-to-peer network based digital currency using the Scrypt Algorhythm."
arch=('i686' 'x86_64')
url="http://www.ccoin.cc"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf' 'bash-completion')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('ccoin')
license=('MIT')
source=(git://github.com/beastlymac/ccoin.git)
sha512sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  cd "$srcdir/${pkgname%-*}"

  qmake-qt4
  make # $MAKEFLAGS

  # make ccoin daemon
  cd "$srcdir/${pkgname%-*}/src"
  make $MAKEFLAGS -f makefile.unix ccoind
}

package() {
  cd "$srcdir/${pkgname%-*}"

  # Copy examples
  mkdir -p "$pkgdir/usr/share/ccoin"
  cat contrib/debian/*.examples | sed -e 's@^\(debian\)@contrib/\1@' | xargs -I{} install -Dm0644 {} "$pkgdir/usr/share/ccoin/"

  # Install CCoin wallet
  install -D -m755 "$srcdir/${pkgname%-*}/ccoin-qt" "$pkgdir/usr/bin/ccoin-qt"

  # install CCoin daemon
  install -D -m755 "$srcdir/${pkgname%-*}/src/ccoind" "$pkgdir/usr/bin/ccoind"

  # install license
  install -D -m644 "$srcdir/${pkgname%-*}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


