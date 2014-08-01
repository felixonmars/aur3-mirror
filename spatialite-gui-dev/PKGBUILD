# Maintainer: SaultDon <sault.don gmail>
# Contributor: strigyskow
pkgname=spatialite-gui-dev
_pkgname=spatialite-gui
pkgver=1.8.0
pkgrel=1
pkgdesc="A Graphical User Interface (GUI) tool supporting SpatiaLite (development version)."
url="https://www.gaia-gis.it/fossil/spatialite_gui/index"
arch=('x86_64' 'i686')
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('libspatialite' 'librasterlite2' 'libxml2' 'libfreexl' 'wxgtk')
makedepends=('fossil')

prepare() {
  cd "$srcdir"

  fossil clone "https://www.gaia-gis.it/fossil/spatialite_gui/timeline?r=trunk" $_pkgname.fossil

  mkdir "$_pkgname-$pkgver"
  cd "$_pkgname-$pkgver"

  fossil open ../$_pkgname.fossil
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix="/usr" CXXFLAGS="`wx-config --cxxflags`" LIBS="`wx-config --libs core,base,aui`"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-strip
  install -Dm644 gnome_resource/spatialite-gui.desktop "$pkgdir/usr/share/applications/spatialite-gui.desktop"
  install -Dm644 gnome_resource/spatialite-gui.png "$pkgdir/usr/share/pixmaps/spatialite-gui.png"
}
