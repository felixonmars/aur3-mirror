# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=logalert
pkgver=0.3
pkgrel=7
pkgdesc="A logfile monitoring tool which executes a specific action whenever it matches a string (pattern) occurrence."
arch=('i686' 'x86_64')
url="http://logalert.sourceforge.net/"
license=('GPL')
depends=('pcre')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('fd02ca21e4ccd34d0e1609abc89aefce')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}




