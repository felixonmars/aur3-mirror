# Maintainer: Ray Rashif <schivmeister@gmail.com>

pkgname=pyabiword
pkgver=0.8.0
pkgrel=1
pkgdesc="Python bindings for AbiWord"
arch=(i686 x86_64)
url="http://abisource.com/"
license=('GPL')
depends=('abiword' 'pygtk')
options=('!libtool')
source=(http://www.abisource.com/downloads/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
md5sums=('826ea3e4cdcdd11906ce8739d07e6c26')
