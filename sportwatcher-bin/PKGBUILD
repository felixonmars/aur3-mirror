# Maintainer: zoe <chp321 at gmail dot com>

pkgname=sportwatcher-bin
_pkgname=sportwatcher
pkgver=0.7
pkgrel=1
pkgdesc="KDE program, who reads data out of a Garmin GPS-device ; version from deb binary amd64 Debian wheezy/sid (testing)"
url="http://www.theosys.at/sportwatcher/index.html"
arch=('x86_64')
license=('GPL')
depends=('gdal' 'mapnik' 'kdelibs' 'libusb')
makedepends=('tar')
provides=(sportwatcher)
conflicts=(sportwatcher)
source=("http://www.theosys.at/download/${_pkgname}_${pkgver}-3_amd64.deb")
md5sums=('7141a2cb8d13c1ca46ed66a2b4462f9e')

package() {
  cd $srcdir
  ar x "${_pkgname}_${pkgver}-3_amd64.deb"
  tar xvf data.tar.gz
  cp -rp usr $pkgdir
  cp -rp etc $pkgdir
}