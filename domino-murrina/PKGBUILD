# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=domino-murrina
pkgver=0.3
pkgrel=2
pkgdesc="A program for creating Domino configs for different color schemes"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php?content=51597"
license="GPL"
depends=('kdelibs')
source=(http://dominomurrina.do.funpic.de/domino_murrina_${pkgver}.tar.gz)
md5sums=('7c2bf466ed5a0378ce94d2fc71b21085')

build() {
  cd ${startdir}/src/domino_murrina/
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
