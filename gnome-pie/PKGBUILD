# Maintainer: Vinilox
pkgname=gnome-pie
pkgver=0.5.5
pkgrel=3
pkgdesc="A visual application launcher for gnome."
arch=('i686' 'x86_64')
url="https://github.com/Simmesimme/Gnome-Pie"
license=('GPL')
depends=('gtk3' 'gnome-menus' 'cairo' 'libgee06' 'libxml2' 'libxtst' 'libunique3' 'gdk-pixbuf2' 'hicolor-icon-theme' 'bamf')
makedepends=('gcc' 'vala' 'cmake')
install=gnome-pie.install
conflicts=(gnome-pie-git)
source=("https://github.com/Simmesimme/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6f70079f8a59bdcd4afe17a3f016b196')
build() {
cd $srcdir/Gnome-Pie-$pkgver
msg "Building gnome-pie"
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
}

package() {
cd $srcdir/Gnome-Pie-$pkgver/build
make DESTDIR=$pkgdir install
install $srcdir/Gnome-Pie-$pkgver/resources/*.desktop ${pkgdir}/usr/share/applications
} 
