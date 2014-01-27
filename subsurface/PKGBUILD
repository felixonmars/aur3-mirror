# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=subsurface
pkgver=4.0.2
pkgrel=2
pkgdesc="A divelog software written by Linus"
arch=('i686' 'x86_64')
url="http://subsurface.hohndel.org/"
license=('GPL2')
depends=('libdivecomputer>=0.4.1' 'libxml2' 'qt4' 'glib2' 'hicolor-icon-theme' 'qtwebkit' 'libzip' 'libsoup' 'kdeedu-marble')
optdepends=()
makedepends=('make' 'asciidoc')
install=subsurface.install
provides=()
conflicts=()
source=("http://subsurface.hohndel.org/downloads/Subsurface-${pkgver}.tgz")
md5sums=('fb1aa01e00fc9c492847d26abec14eb7')


build() {
  cd "$srcdir/Subsurface-${pkgver}"

  qmake-qt4
  #Prevent pacman/namcap warning
  sed -i -e "s|\$(INSTALL) -d -m 644 \$(MANDIR)|\$(INSTALL) -d -m 755 \$(MANDIR)|" Makefile
  #gtk_update is handle by the PKGBUILD
  sed -i -e "s|\$(gtk_update_icon_cache)| |" Makefile

  make
}

package() {
  cd "$srcdir/Subsurface-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
