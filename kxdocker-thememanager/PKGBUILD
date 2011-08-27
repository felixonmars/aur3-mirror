# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: BaSh <bash.lnx@gmail.com>

pkgname=kxdocker-thememanager
pkgver=1.0.0
pkgrel=2
pkgdesc="Theme manager for KXDocker"
arch=('i686' 'x86_64')
url="http://www.xiaprojects.com/index.php?section=All&project=KXDocker"
license=('GPL')
depends=('kxdocker')
source=(http://www.xiaprojects.com/downloads/KXDocker/sources/1.0.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('955dde230a91ea0d3c3a565bfd9f5089')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
