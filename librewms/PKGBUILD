# Maintainer: SaultDon <sault.don gmail>
# Contributor: strigyskow
pkgname=librewms
pkgver=1.0.0
pkgrel=1
pkgdesc="A Geography application. It's an almost complete WMS 1.3.0 interactive GUI client."
url="https://www.gaia-gis.it/fossil/librewms/index"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('libspatialite' 'librasterlite2' 'wxgtk')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-$pkgver.tar.gz")
md5sums=('c0b754d230b8d280076d63659bb736a7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="/usr" CXXFLAGS="`wx-config --cxxflags`" LIBS="`wx-config --libs core,base,aui`"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-strip
  install -Dm644 gnome_resource/LibreWMS.desktop "$pkgdir/usr/share/applications/LibreWMS.desktop"
  install -Dm644 gnome_resource/LibreWMS.png "$pkgdir/usr/share/pixmaps/LibreWMS.png"
}
