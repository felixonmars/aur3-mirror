 # Contributor: ArcherSeven <archermmb@aim.com>
pkgname=eiskaltdc-gtk
pkgver=2.2.6
pkgrel=1
pkgdesc="GTK2 GUI-frontend for dclib(like Valknut) with segmented downloading"
url="http://code.google.com/p/eiskaltdc/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'libglade' 'libxml2' 'bzip2' 'openssl' 'zlib' 'gettext' 'pango' 'glib2' 'boost-libs')
makedepends=('cmake' 'boost')
#conflicts=('eiskaltdc-svn' 'eiskaltdc')
provides=('eiskaltdc-gtk')
source=(http://eiskaltdc.googlecode.com/files/eiskaltdcpp-$pkgver.tar.xz)
sha1sums=('696a3a26b551848a336a58c7bb241b8d234851fd')


build() {
	cd eiskaltdcpp-${pkgver}
	mkdir -p builddir && cd builddir
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT=OFF -DUSE_GTK=ON -DUSE_LIBNOTIFY=OFF ../
	make
}
package() {
	cd "eiskaltdcpp-${pkgver}/builddir"
	make DESTDIR=${pkgdir} install
}
