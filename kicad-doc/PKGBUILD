#Contributor Pengyu <milkline@gmail.com>
pkgname=kicad-doc
pkgver=20110704
pkgrel=1
pkgdesc="Kicad user documentation"
arch=('i686' 'x86_64')
url="http://iut-tice.ujf-grenoble.fr/kicad/"
license=('GPL')
depends=()
makedepends=('cmake')
options=('docs')
source=(http://iut-tice.ujf-grenoble.fr/cao/docs_and_translations_kicad_2011-07-04.zip)
md5sums=('1041d93b8c39c1626c68a0c800226be1')

build() {
cd ${srcdir}/doc
cmake ${srcdir}/doc -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr || return 1
make DESTDIR=${pkgdir} install || return 1
}
