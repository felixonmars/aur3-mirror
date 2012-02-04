# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=kxdocker-trayiconlogger
pkgver=1.0.0
pkgrel=2
pkgdesc="Tray icon logger for KXDocker"
arch=('i686' 'x86_64')
url="http://www.xiaprojects.com/index.php?section=All&project=KXDocker"
license=('GPL')
groups=('kxdocker')
depends=('kxdocker')
source=(http://www.xiaprojects.com/downloads/KXDocker/sources/1.0.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7dbbffbafb8bbdfed3113225f2ae89de')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
