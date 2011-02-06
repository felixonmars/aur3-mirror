# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=kxdocker-dcop
pkgver=1.0.0
pkgrel=2
pkgdesc="DCOP interface for KXDocker"
arch=('i686' 'x86_64')
url="http://www.xiaprojects.com/index.php?section=All&project=KXDocker"
license=('GPL')
groups=('kxdocker')
depends=('kxdocker')
source=(http://www.xiaprojects.com/downloads/KXDocker/sources/1.0.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('8a2fbd2d29384d40777ff33844bc8411')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
