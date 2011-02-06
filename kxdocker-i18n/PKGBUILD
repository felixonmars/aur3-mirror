# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=kxdocker-i18n
pkgver=1.0.2
pkgrel=1
pkgdesc="Language packs for KXDocker"
arch=('i686' 'x86_64')
url="http://www.xiaprojects.com/index.php?section=All&project=KXDocker"
license=('GPL')
depends=('kxdocker')
source=(http://www.xiaprojects.com/downloads/KXDocker/sources/1.0.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3b8ad3cd075f0eaf4024648754d88bdf')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
