# Maintainer: Quentin Stievenart <quentin.stievenart@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mk-configure
pkgver=0.28.0
pkgrel=1
pkgdesc="Lightweight replacement for GNU autotools"
arch=('i686' 'x86_64')
makedepends=('bmake' 'bmkdep' 'makedepend')
url="https://github.com/cheusov/mk-configure"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cheusov/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('2fa9a4846adbc1031411c8cd1d278ee8bef288a6c98fa16a28ba208a0a21ddd5')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep all
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep DESTDIR="$pkgdir" install
}
