# Contributor: rabyte <rabyte*at*gmail*dot*com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sizzleopt
pkgver=0.0.3
pkgrel=1
pkgdesc="Add ons for the sizzle interpreter"
arch=('i686' 'x86_64')
url="http://www.grabmueller.de/martin/www/sizzle/sizzle.en.html"
license=('GPL')
source=(http://www.grabmueller.de/martin/www/tarballs/$pkgname-$pkgver.tar.gz \
  sizzleopt.patch)
md5sums=('1042cc55f0d99cca29ba58d3b5af22f1' '95d02e2837db8bec48197f06f6091b3b')
options=('libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  patch -p1 < ../sizzleopt.patch || return 1
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}
