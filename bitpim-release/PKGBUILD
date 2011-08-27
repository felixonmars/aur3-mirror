# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=bitpim-release
pkgver=1.0.7
pkgrel=1
pkgdesc="A program to view and manipulate data on many CDMA phones from LG, Samsung, Sanyo, etc."
arch=('i686')
url="http://www.bitpim.org/"
license=('GPL')
depends=('python' 'gtk2' 'libusb' 'libstdc++5' 'gmp' 'libsm' 'libxxf86vm' 'libjpeg6' 'libpng12')
makedepends=('rpmextract')
options=('!strip')
source=(http://downloads.sourceforge.net/bitpim/$pkgver/bitpim-$pkgver-0.i386.rpm)
md5sums=('7cb50801f5469ecd77be155cdef34d53')

build() {
  cd $srcdir
  rpmextract.sh bitpim-$pkgver-0.i386.rpm
  mv usr $pkgdir
  cd $pkgdir
  chmod -R 755 $pkgdir/usr
  chown -R root:root $pkgdir/usr
  cp -a /usr/lib/libexpat.so ./usr/lib/libexpat.so.0
  mkdir -p ./usr/share/applications
  #install -m755 $startdir/bitpim.desktop ./usr/share/applications
}

