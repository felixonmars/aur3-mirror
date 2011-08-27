# Maintainer: Darin <omgwtfbyobbq at gmail d0t com>
pkgname=usbb2k-api
pkgver=2.1
pkgrel=1
pkgdesc="A modified version of an API (daemon) to handle a VOIP box of the type USB-B2K"
url="http://sourceforge.net/projects/kb2kskype/"
arch=('i686')
license=('GPL')
depends=(libusb)
source=('http://downloads.sourceforge.net/project/kb2kskype/usbb2k-api/usbb2k-api-mod-2.8/usbb2k-api-mod-2.8.tar.bz2?use_mirror=softlayer&ts=1279699561')
md5sums=('74d7a6f549b402308c4b950aa31e4390')

build() {
  cd $srcdir/$pkgname
  ./configure
  make || return 1
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$pkgname/src/usbb2k_api  $pkgdir/usr/bin
}
