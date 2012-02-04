# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname="gimp-plugin-file-ora"
pkgver=0.1.0
pkgrel=1
pkgdesc="OpenRaster load/save handler for GIMP"
url="http://create.freedesktop.org/wiki/OpenRaster"
license=("GPL2")
arch=("any")
depends=("gimp" "python")
_sourceroot="http://www.jonnor.com/files/"
source=($_sourceroot/$pkgname-$pkgver.tar.gz)
md5sums=('fd1c638f3017d33f55734840b7aa5e0b')

package() {
    cd "$srcdir/$pkgname-$pkgver"

	install -D -m755 file-ora.py \
		${pkgdir}/usr/lib/gimp/2.0/plug-ins/file-ora.py
}

# vim: set noet ff=unix
