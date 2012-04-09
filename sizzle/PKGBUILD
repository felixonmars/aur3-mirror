# Contributor: rabyte <rabyte*at*gmail*dot*com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sizzle
pkgver=0.0.31
pkgrel=8
pkgdesc="An interpreter for the Scheme programming language"
arch=('i686' 'x86_64')
url="http://www.grabmueller.de/martin/www/sizzle/sizzle.en.html"
license=('GPL')
install=sizzle.install
source=(http://www.grabmueller.de/martin/www/tarballs/$pkgname-$pkgver.tar.gz \
  sizzle.patch po.patch)
md5sums=('86f19180d1f71d30fe307bd18c16b62a'
         '9146bd1fd8a4de1133eacfd0ac0c06b7'
         '4dc3214fbc29bd34770fa6c4c6202a9c')
options=('libtool')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../sizzle.patch 
  patch -p1 < ../po.patch
  ./configure --prefix=/usr --infodir=/usr/share/info --mandir=/usr/share/man
  cd po
  make de.mo
  cd ..
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 po/de.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/sizzle.mo
}
