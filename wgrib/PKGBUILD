# Contributor: Brian Lin <iamsmrtk at gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib
pkgver=1.8.1.0b
pkgrel=1
pkgdesc="A program to manipulate, inventory and decode GRIB files"
arch=('i686')
url="http://www.cpc.ncep.noaa.gov/products/wesley/wgrib.html"
license=('custom')
depends=('glibc')
source=(ftp://ftp.cpc.ncep.noaa.gov/wd51we/$pkgname/$pkgname.tar.v$pkgver \
  ftp://ftp.cpc.ncep.noaa.gov/wd51we/$pkgname/NOTICE)
md5sums=('406a0b9178a437b8d766ca8f542f431e'
         '6784a4b9c74ed1d6cfc3cdbfe94925cc')

build() {
  cd $srcdir
  make || return 1
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 NOTICE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}