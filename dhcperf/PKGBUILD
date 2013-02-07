# Maintainer: Rodrigo Cares <rcares@gmail.com>
pkgname=dhcperf
pkgver=1.0.1.0
pkgrel=1
pkgdesc="Measures the DHCP lease assignments to client computers by ramping up lease assignment over time to determine the maximum performance profile."
arch=('any')
url="http://www.nominum.com/support/measurement-tools/"
license=('unknown')
makedepends=('rpmextract')
options=('emptydirs')
source=("ftp://ftp.nominum.com/pub/nominum/dhcperf/1.0.1.0/dhcperf-$pkgver-$pkgrel-rhel-4-i386.tar.gz")
md5sums=('bfca5aaadefdf7119f644e709bff717e')

build() {
  cd "$pkgdir"
  rpmextract.sh ../src/dhcperf-$pkgver-$pkgrel/dhcperf-$pkgver-$pkgrel.i386.rpm
}
