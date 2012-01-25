# Maintainer: Tom Vincent <http://tlvince.com/contact/>
# Contributor: c0nd0r <gcesarmza@gmail.com>
pkgname=bin32-openjdk7
_pkgname=jdk7-openjdk
pkgver=7.b147_2.0
pkgrel=5
pkgdesc="32-bit Free Java environment based on OpenJDK 7.0 with IcedTea6 replacing binary plugs for Arch x86_64"
arch=('x86_64')
license=('custom')
url="http://www.java.net"
depends=('lib32-gcc-libs' 'lib32-libxtst' 'lib32-libxt' 'lib32-nss'
         'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libxrender'
         'ca-certificates-java')
source=(http://mirrors.kernel.org/archlinux/extra/os/i686/${_pkgname}-$pkgver-$pkgrel-i686.pkg.tar.xz)

md5sums=('69bb14e68f788cfdb62b17371766c5bc')

build() {
  cd ${startdir}/src
  mv usr $pkgdir
  cd $pkgdir/usr
  mv lib lib32
  rm -rf bin
  rm -rf share
}
