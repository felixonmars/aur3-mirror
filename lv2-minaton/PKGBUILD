# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=minaton
pkgname=lv2-$_name
pkgver=0.0.1
pkgrel=1
pkgdesc="A music software synthesizer project, LV2 instrument."
arch=(i686 x86_64)
url="http://sourceforge.net/p/minaton/home/Home/"
license=('GPL')
depends=('jack' 'gtkmm' 'lv2core')
makedepends=('unarj' 'lv2-c++-tools')
source=("http://downloads.sourceforge.net/project/$_name/$_name-lv2-v.$pkgver.tar.gz")
md5sums=('45595f72e8d4cf16b59f3527790c9032')

build() {
  cd "$srcdir" && unarj x *.tar.gz && cd $_name-lv2

  # makefile fix
  sed -i "s/\(install:\).*/\1/" makefile

  make
}

package() {
  cd "$srcdir/$_name-lv2"

  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install
}

# vim:set ts=2 sw=2 et:
