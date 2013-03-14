# Contributer: giacomogiorgianni@gmail.com

pkgname=intensityengine
pkgver=1.1.6
pkgrel=1
pkgdesc="Te Intensity Engine is the open source project that forms the basis of Syntensity."
arch=('i686' 'x86_64')
url="http://www.syntensity.com/"
license=('GPL')
depends=('sdl' 'boost' 'zlib' 'python2-django' 'intensityengine-data')
makedepends=('boost')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('a78a671e59d1ffc447eedcfb0877144d')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
    md5sums=('6fd8de4c34aee1fb4785d94945f0f5d9')
fi

#source=http://archive.getdeb.net/ubuntu/pool/games/i/intensityengine/${pkgname}_${pkgver}-${pkgrel}~getdeb5~precise_${ARCH}.deb
source=(http://ftp.dk.debian.org/getdeb/ubuntu/pool/games/i/${pkgname}/${pkgname}_${pkgver}-${pkgrel}~getdeb7~quantal_${ARCH}.deb)
build() {
	cd ${startdir}/src
	#ar -x ${startdir}/src/data_${pkgver}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	cp -r ${startdir}/src/usr/ ${startdir}/pkg/
	ln -s "/usr/lib/libboost_python.so" "$pkgdir/usr/lib/libboost_python-py27.so.1.49.0"
	mkdir -p "$pkgdir"/usr/bin
	ln -s $srcdir/usr/games/${pkgname} "$pkgdir"/usr/bin/${pkgname}.sh
}
