# Maintainer: Alucryd <alucryd at gmail dot com>
# Contributor: Sebastian Lenz <sebastian@archusers.de>

pkgname=gnome-shell-extension-common-git
pkgver=3.8.3.1.real.10
pkgrel=1
pkgdesc="Common files for the GNOME Shell Extensions"
arch=('any')
url="http://live.gnome.org/GnomeShell/Extensions"
license=('GPL' 'LGPL')
depends=('gnome-shell')
makedepends=('git' 'gnome-common' 'intltool')
provides=("${pkgname%-*}")
conflicts=('gnome-shell-extension-git' "${pkgname%-*}")
source=('git+http://git.gnome.org/browse/gnome-shell-extensions#branch=gnome-3-8')
sha256sums=('SKIP')

pkgver() {
  cd gnome-shell-extensions

  git describe | sed 's|\(.*-.*\)-.*|\1|;s|-|.|g'
}

build() {
  cd gnome-shell-extensions

  ./autogen.sh --prefix='/usr' --disable-schemas-compile --enable-extensions=""
  make
}

package() {
  cd gnome-shell-extensions

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
