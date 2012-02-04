# Contributor: Davidov Denis <shurup777@ngs.ru>

pkgname=korvet
pkgver=0.92
pkgrel=1
pkgdesc="Korvet PC emulator (clone i8080)"
arch=(i686 x86_64)
url="http://pk8020.narod.ru/"
license=('GPL')
depends=('allegro')
options=()
source=(http://korvet.svn.sourceforge.net/svnroot/korvet/korvet-${pkgver}.tar.bz2)
md5sums=('f77024c5c339180577143a61643457de')

build() {
  cd ${srcdir}"/"${pkgname}"-"${pkgver} || return 1
  make || return 1
  ROOTDIR=${startdir}/pkg make install || return 1
}

