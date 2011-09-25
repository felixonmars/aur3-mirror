pkgname=ne-nopdf
_pkgname=ne
pkgver=2.2
pkgrel=1
pkgdesc="the nice editor, without pdf document"
arch=('i686' 'x86_64')
url="http://ne.dsi.unimi.it"
license=('GPL')
depends=('glibc' 'ncurses' 'texinfo')
replaces=('ne')
conflicts=('ne')
options=('!makeflags')
install=ne.install
source=(http://ne.dsi.unimi.it/${_pkgname}-${pkgver}.tar.gz)
md5sums=('552d1e0d2bd5361575daef29f617683c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd src make NE_GLOBAL_DIR=/usr/lib/ne
  cd -
  make PREFIX="${pkgdir}/usr" install || return 1
}
