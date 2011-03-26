# Contributor: Charly Ghislain <charlyghislain@gmail.com>
pkgname=cups-windows
pkgver=6.0
pkgrel=1
pkgdesc="Cups Windows drivers, for Win2K and above"
url="http://www.cups.org/software.php"
license=('custom')
makedepends=('cmake' 'subversion')
depends=('cups')
source=(http://ftp.easysw.com/pub/cups/windows/${pkgname}-${pkgver}-source.tar.bz2)
md5sums=('e4569a58b6ad8bdef3208c4385c52625')
install=(${pkgname}.install)
arch=('i686' 'x86_64')


build() {
 cd $startdir/src

 cd ${pkgname}-${pkgver}

 make BUILDROOT=${startdir}/pkg install

}
