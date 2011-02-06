# Mantainer: Antonio Sanguigni <a.sanguigni@gmail.com>
pkgname=littlewizard
pkgver=1.2.2
pkgrel=1
pkgdesc="A package to teach the kids developing software"
arch=('i686' 'x86_64')
url="http://littlewizard.sourceforge.net/"
license=('GPL')
depends=('gtk2>=2.4' 'libxml2')
source=(http://downloads.sourceforge.net/littlewizard/$pkgname-$pkgver.tar.gz
        )
md5sums=('1a6f4405418c8b55b29de0ce5934d73f'
          ) 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
