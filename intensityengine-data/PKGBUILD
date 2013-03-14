# Contributer: giacomogiorgianni@gmail.com

pkgname=intensityengine-data
pkgver=1.1.6
pkgrel=1
pkgdesc="The Intensity Engine is the open source project that forms the basis of Syntensity."
arch=('any')
url="http://www.syntensity.com/"
license=('GPL')
depends=('sdl')
makedepends=('intensityengine')
md5sums=('a4acf9cebbbb92784b295827c14b1e71')

source=http://ftp.dk.debian.org/getdeb/ubuntu/pool/games/i/intensityengine/${pkgname}_${pkgver}-${pkgrel}~getdeb7~quantal_all.deb
#source=http://archive.getdeb.net/ubuntu/pool/games/i/intensityengine/${pkgname}_${pkgver}-${pkgrel}~getdeb4~natty_all.deb
build() {
	cd ${startdir}/src
	#ar -x ${startdir}/src/data_${pkgver}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	cp -r ${startdir}/src/usr/ ${startdir}/pkg/
}
