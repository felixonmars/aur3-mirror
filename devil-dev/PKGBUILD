# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Contributor: damir <damir@archlinux.org>
# Contributor: TheHoff <forums>
# Maintainer: Aurélien DESBRIÈRES <ice.cube@gmx.com>

pkgname=devil-dev
pkgver=1.6.8
_pkgrel=rc2
pkgrel=1
pkgdesc="Library for reading several different image formats"
arch=('i686' 'x86_64')
url="http://openil.sourceforge.net/"
conflicts=('devil')
provides=('devil')
depends=('sdl' 'libpng' 'zlib' 'libjpeg' 'libtiff' 'libmng')
makedepends=('bash')
options=('!libtool')
license=('GPL')
source=(http://puzzle.dl.sourceforge.net/sourceforge/openil/DevIL-$pkgver-$_pkgrel.tar.gz devil_gcc4.3.patch)
md5sums=('9d815c8637adb6fb6c25c38dc178aca2'
	 'b71f41656843f01874a12924d1d60572')

build()
{
   cd $startdir/src/DevIL-$pkgver
   patch -p1 -i ../devil_gcc4.3.patch

   # configure and build
   ./configure --prefix=/usr --with-gnu-ld --disable-allegro
   make || return 1
   make prefix=$startdir/pkg/usr install
}
