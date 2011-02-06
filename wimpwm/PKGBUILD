# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wimpwm  
pkgver=0.1.1
pkgrel=3
pkgdesc="Window manager extensible using the scheme dialect sizzle"
url="http://www.grabmueller.de/martin/www/wimpwm/wimpwm.en.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxext' 'libsm')
makedepends=('sizzle') # static library libsizzle.a is linked to wimpwm
install=wimpwm.install
source=(http://www.grabmueller.de/martin/www/tarballs/$pkgname-$pkgver.tar.gz \
  wimpwm.local.patch)
md5sums=('002f9a6d5ee4bba794cfd7c819eac4ae' '38976b4d5a78336fffed0f0fa8497e7a')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --infodir=/usr/share/info || return 1
  patch -p1 < ../wimpwm.local.patch || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  gzip $pkgdir/usr/share/info/$pkgname-ref.info || return 1
  rm $pkgdir/usr/share/info/dir || return 1
}
