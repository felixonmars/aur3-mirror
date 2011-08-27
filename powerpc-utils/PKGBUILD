# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=powerpc-utils
pkgver=1.1.3
pkgrel=1
pkgdesc="Utilites for maintaining and enabling features for powerpcs"
arch=('i686' 'x86_64' 'ppc')
url="http://http.us.debian.org/debian/pool/main/p/powerpc-utils/"
license=('GPL2')
depends=()
makedepends=()
install=
source=(http://ftp.us.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}-22_powerpc.deb)
md5sums=('e116f04c590f62d0d51050acaaba75a3')


build() {

  [ -d $pkgname-$pkgver ] || mkdir $pkgname-$pkgver

  bsdtar -xf ${pkgname}_${pkgver}-22_powerpc.deb
  bsdtar -xf data.tar.gz -C $pkgname-$pkgver

  cd $pkgname-$pkgver
  cp -r * $pkgdir

}
