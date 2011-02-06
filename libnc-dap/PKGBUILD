# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=libnc-dap
pkgver=3.7.4
pkgrel=2
pkgdesc="An alternative implementation of Unidata's netCDF 3.6 API"
arch=('i686' 'x86_64')
url="http://www.opendap.org/download/nc-dap.html"
license="LGPL2.1"
depends=('curl' 'libxml2' 'libdap')
provides=('netcdf')
conflicts=('netcdf')
options=('!libtool')
source=(http://www.opendap.org/pub/source/$pkgname-$pkgver.tar.gz)
md5sums=('671bf7ad07e00ed0be6518a80792c587')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
