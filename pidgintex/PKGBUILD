# Contributor: Ramses de Norre

pkgname="pidgintex"
pkgver=1.1.1
pkgrel=1
pkgdesc="A plugin to render LaTeX expressions in messages"
arch=(i686 x86_64)
url="http://code.google.com/p/pidgintex/"
license=('GPL2')
depends=('pidgin')
install=('pidgintex.install')
source=(http://pidgintex.googlecode.com/files/pidginTeX-$pkgver.tar.gz)

build() {
  cd $srcdir/pidginTeX-$pkgver
  make || return 1
  make DESTDIR=$pkgdir PREFIX="$pkgdir/usr" install || return 1
}

md5sums=('b0f19a7b2f14d709c4acc32f7e46fcb5')
