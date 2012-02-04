# Contributor: Ben Duffield <jebavarde@gmail.com>
pkgname=noteo-batterystatus
pkgver=0.0.3
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Module for noteo which warns of low battery and shows percentage remaining"
url="http://sourceforge.net/projects/noteo/"
license=("GPL")
depends=("noteo>=0.0.6" "acpi" "pygtk")
install=noteo-batterystatus.install
source=("http://downloads.sourceforge.net/noteo/${pkgname}-${pkgver}.tar.gz")
md5sums=('af81c99f208fa1611bba8f9027a74160')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/noteo
  mv BatteryStatus $startdir/pkg/usr/share/noteo/
}