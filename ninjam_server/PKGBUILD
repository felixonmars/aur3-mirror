# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=ninjam_server
pkgver=0.06
pkgrel=1
pkgdesc="A program to allow people to make real music together via the Internet; server side utility"
arch=('i686' 'x86_64')
url="http://www.ninjam.com/"
license=('GPL')
depends=('gcc')
source=(http://www.ninjam.com/downloads/src/${pkgname}_${pkgver}.tar.gz)
md5sums=('60a624606313a9c8d3276893d3012880')

build() {
  cd $srcdir/${pkgname}_${pkgver}/ninjam/server
  make || return 1
  install -D -m755 ninjamsrv $pkgdir/usr/bin/ninjamsrv
}
