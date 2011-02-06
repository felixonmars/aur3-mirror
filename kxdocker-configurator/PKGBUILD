# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: BaSh <bash.lnx@gmail.com>

pkgname=kxdocker-configurator
pkgver=1.0.2
pkgrel=1
pkgdesc="Configuration utility for KXDocker"
arch=('i686' 'x86_64')
url="http://www.xiaprojects.com/index.php?section=All&project=KXDocker"
license=('GPL')
depends=('kxdocker')
groups=('kxdocker')
source=(http://www.xiaprojects.com/downloads/KXDocker/sources/1.0.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1b5b78f329d51d56fa3d1e9cce05a550')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
