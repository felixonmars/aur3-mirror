
pkgname=qgrab
name=QGrab
pkgver=023
pkgdesc="Minimalistic screen grabber, no kidding it is very minimalistic - but also very lightweight."
pkgrel=2
arch=(i686 x86_64)
url="http://Qt-Apps.org/content/show.php/QGrab?content=149223"
license=(GPL)
makedepends=('cmake')
depends=('qt4')
options=()
source=("http://illogical.dk/spock/flywheel/Qt/${name}/${name}_${pkgver}.tar.gz")
md5sums=('621a14be2ed068d6e2929adff70b2d98')

build(){
  cd ${srcdir}/${name}_${pkgver}
  qmake-qt4 $name.pro
  make clean && make
}

package(){
  cd ${srcdir}/${name}_${pkgver}
#  make DESTDIR="${pkgdir}" install
  install -D -m755 ${name} ${pkgdir}/usr/bin/qgrab || return 1
}
