# Maintainer: Eivind Eide <xenofil A-T gmail D-O-T com>
pkgname="mac-port"
_shnver="s7"
pkgver="3.99.u4.b5.${_shnver}"
_realver="3.99-u4-b5-${_shnver}"
pkgrel="5"
pkgdesc="Monkey's Audio lossless audio codec (.ape format) - shntool patched for correct *nix stdin/stdout"
arch=('i686' 'x86_64')
url="http://etree.org/shnutils/shntool/support/formats/ape/unix"
license=('custom')
depends=('gcc-libs')
makedepends=('yasm')
options=('!libtool')
provides=('mac')
conflicts=('mac')
source=("${url}/${_realver}/mac-${_realver}.tar.gz")
md5sums=('74df3c96476636387ddd12255b03bebe')

build() { 
	cd "${srcdir}/mac-${_realver}/"
        export CXXFLAGS="-DSHNTOOL"
	./configure --prefix="/usr" --enable-assembly="yes"
	make
}

package() { 
	cd "${srcdir}/mac-${_realver}/"
	make DESTDIR="${pkgdir}" install
        install -Dm644 src/License.htm \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}

