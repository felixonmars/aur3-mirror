# Maintainer: Fernando Jiménez Solano <fjim@sdfeu.org>

pkgname=mosaic-ck
pkgver=2.7ck9
pkgrel=1
pkgdesc="One of the few maintained versions of the historical web browser."
arch=('i686' 'x86_64')
url="http://www.floodgap.com/retrotech/machten/mosaic/" 
license=('NCSA')
depends=('libjpeg-turbo' 'libpng12' 'openmotif' 'zlib')
makedepends=()
optdepends=()
conflicts=()
install=
backup=()
source=(http://www.floodgap.com/retrotech/machten/mosaic/mosaic27ck9.tar.gz
	'png.patch')
sha512sums=('b002c3d18747c91a4b6b012d54649f7cd9213d153cb08ab8bcde033d9afe1c155c769d4f472b7a1a2d0e4a9d7a073298c65f7915808dd5345f68dd5deb6df744'
            '283efd0a23c876793a5437b7098b6257951472fe845af5ce11ddcaf6b951d163090d321db856f977f417af13b9dd9dbcd118ee173a2c329bb5affd1290ffe093')

build() { 
    patch -p0 < png.patch
	cd ${srcdir}/${pkgname}
	make linux
}

package() {
    echo Cding
	cd ${srcdir}/${pkgname}
    echo install1
    install -d ${pkgdir}/usr/bin
    echo intall2
    install -m755 ${srcdir}/${pkgname}/src/Mosaic ${pkgdir}/usr/bin/Mosaic
}
