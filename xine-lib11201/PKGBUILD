# Author: Lushnikov Alexander <alegz@nix.uz>

pkgname=xine-lib11201
_origname=xine-lib
pkgver=1.1.20.1
pkgrel=1
pkgdesc="A multimedia playback engine 1.1.20.1 version for amarok1 working"
arch=('x86_64')
url="http://www.xine-project.org"
license=(LGPL  GPL)
depends=('libxvmc'  'ffmpeg'  'libxinerama')
optdepends=('imagemagick: for using the imagemagick plugin'
	               'jack: for using the jack plugin'
	               'vcdimager: for using the vcd plugin'
	               'mesa: for using the opengl plugin'
	               'wavpack: for using the wavpack plugin'
	               'faad2: for using the faad plugin'
	               'libmng: for using the mng plugin'
	               'aalib: for using the aalib plugin'
	               'libmodplug: for using the modplug plugin'
	               'libdca: for using the dca plugin'
	               'a52dec: for using the a52 plugin'
	               'libmad: for using the mp3 plugin'
	               'libmpcdec: for using the musepack plugin'
	               'libcaca: for using the caca plugin'
	               'libbluray: for using the bluray plugin'
	               'gnome-vfs: for using the gnome-vfs plugin')
makedepends=('mercurial' 'pkgconfig')

source=("http://downloads.sourceforge.net/project/xine/$_origname/$pkgver/$_origname-$pkgver.tar.xz"
	"osd_c_bug.patch")

md5sums=("90f619084c692b4aff20c8f9d1259148"
	"56b5eebfc9de63133e297e4d6455af11")

build() {
	cd $srcdir/$_origname-$pkgver
	patch -p1 < $srcdir/osd_c_bug.patch
	
	./configure --prefix=/opt/kde --disable-static \
	--with-gnu-dl \
	--disable-debug \
	--enable-debug=no

	make -j4
}

package() {
	cd $srcdir/$_origname-$pkgver
	make -j4 DESTDIR="$pkgdir" install
}
