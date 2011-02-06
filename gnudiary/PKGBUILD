 
# Contributor: said <atvordhosbn[at]gmail[dot]com> 

pkgname=gnudiary
pkgver=2.1.0
pkgrel=1
pkgdesc="A personal encrypted diary."
arch=('i686' 'x86_64')
url="http://www.gnufish.net/PcApps/GnuDiary/"
license=('GPL')
depends=('qt>=4.4')
makedepends=()
optdepends=('gpg: encryption suport')
source=(http://launchpad.net/gnudiary/2.1/2.1/+download/${pkgname}_$pkgver.tar.gz)
noextract=()
md5sums=('ddb84d4e5478fd4ee25c5ae77c901dcd')
build() {
  cd $srcdir/${pkgname}_$pkgver
  qmake $pkgname.pro
  make || return 1
  make INSTALL_ROOT=$pkgdir install
}
 
