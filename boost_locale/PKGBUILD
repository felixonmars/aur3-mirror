#Contributor: Cedric GESTES <ctaf42@gmail.com>
#Modified by: dna

pkgname=boost_locale
pkgver=4.0.0
pkgrel=0
pkgdesc="boost locale. This is not yet part of boost"
arch=('i686' 'x86_64')
url="http://cppcms.sourceforge.net/boost_locale/html/index.html"
license=('GPL')
depends=()
makedepends=('cmake' 'boost')
source=("http://downloads.sourceforge.net/project/cppcms/boost_locale/boost_locale_4.0.0.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcppcms%2Ffiles%2Fboost_locale%2F&ts=1319283468&use_mirror=netcologne")
md5sums=('9ef6a093a0979e718e609a21392ae759')

build() {
       cd ${srcdir}/${pkgname}_${pkgver}
       cmake -DCMAKE_INSTALL_PREFIX=/usr .
       make || return 1
}

package() {
       cd ${srcdir}/${pkgname}_${pkgver}
       make DESTDIR=${pkgdir} install || return 1
}
