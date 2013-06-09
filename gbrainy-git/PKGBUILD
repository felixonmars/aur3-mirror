# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=gbrainy
pkgname=${_pkgbase}-git
pkgver=2.2.0.6.gede04af
pkgrel=1
pkgdesc="A brain teaser game and trainer to have fun and to keep your brain trained"
arch=('any')
url="http://live.gnome.org/gbrainy"
license=('GPL2')
depends=('gtk-sharp-2' 'mono-addins' 'librsvg' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gettext' 'gnome-doc-utils' 'git' 'gnome-common')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install=$pkgname.install
source=(git://git.gnome.org/$_pkgbase)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --always | sed 's/^v//;s/-/./g' | cut -d_ -f2-
}

build() {
  cd $_pkgbase
  export MONO_SHARED_DIR="$srcdir"
  ./autogen.sh --prefix=/usr --enable-addins
  make
}

package() {
  cd $_pkgbase
  make DESTDIR="$pkgdir" install
}
