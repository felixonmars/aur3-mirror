# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=valyria-tear
pkgver=0.6
pkgrel=1
pkgdesc="Valyria Tear is an attempt at creating a free (as meant in the Gnu Public License) J-RPG game."
arch=('any')
url="http://valyriatear.blogspot.fr"
license=('GPL')
depends=('sdl' 'sdl_ttf' 'openal' 'libogg' 'libvorbis' 'glu' 'libpng' 'libjpeg' 'gettext' 'lua51')
makedepends=('make' 'cmake')
conflicts=()
source=("https://github.com/Bertram25/ValyriaTear/archive/${pkgver}/valyriatear-${pkgver}.tar.gz")
md5sums=('d91a3a9b1d18d02fb1fa8c7045a8b419')

build() {
    cd $srcdir/ValyriaTear-$pkgver
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DLUA_LIBRARIES=/usr/lib/liblua5.1.so -DLUA_INCLUDE_DIR=/usr/include/lua5.1/ .
	make
}

package() {
    cd $srcdir/ValyriaTear-$pkgver
	make install DESTDIR=$pkgdir
}
