# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=lv2-ll-plugins
_realname=ll-plugins
pkgver=0.2.8
pkgrel=3
pkgdesc="A lv2 host and a collection of lv2 plugins by Lars Luthman"
arch=('i686' 'x86_64')
url="http://ll-plugins.nongnu.org/index.html"
license=('GPL3')
provides=('ll-plugins' 'lv2-ll')
conflicts=('ll-plugins' 'lv2-ll')
depends=('gtkmm' 'lv2-c++-tools' 'libsigc++' 'lash' 'jack' 'lv2core')
source=(http://download.savannah.gnu.org/releases/ll-plugins/ll-plugins-0.2.8.tar.bz2)
md5sums=('56e7f4a62fce6b22b4acdb02ba06669c')

build() {

  export LDFLAGS="${LDFLAGS} -ldl"
  cd "${srcdir}/${_realname}-${pkgver}"

  ./configure --prefix="/usr"
  make
}

package() {

  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
