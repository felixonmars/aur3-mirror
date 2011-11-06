# Contributor: Carlo Casta <carlo.casta at gmail dot com>

pkgname=openflipper
pkgver=1.1
_pkgname=OpenFlipper
pkgrel=1
pkgdesc="An Open Source Geometry Processing and Rendering Framework"
arch=('i686' 'x86_64')
url="http://www.openflipper.org"
license=('LGPL')
depends=('qt>=4.7' 'glut' 'glew' 'openmesh>=2.0')
makedepends=('cmake')
optdepends=('freetype2' 'ftgl')
source=(http://www.openflipper.org/fileadmin/openflipper-files/${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        openflipper.desktop)
md5sums=('7b5b8c7a85ce1a8863d6a91f132a8beb'
         '514fbb8d8f51bdc000e1bac884f21287')

build()
{
	cd "$srcdir/$_pkgname-$pkgver"

	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr          \
	      -DDISABLE_PLUGIN_TEXTURECONTROL=On   \
	      -DCMAKE_BUILD_TYPE=Release  ..

	make
}

package()
{
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR=$pkgdir install || return 1

	# install .desktop file
	install -d $pkgdir/usr/share/applications || return 1
	install $srcdir/openflipper.desktop $pkgdir/usr/share/applications/ || return 1
}
