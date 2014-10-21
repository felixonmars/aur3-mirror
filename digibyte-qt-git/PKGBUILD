# Maintainer: <dx /dot/ 1178 at gmail /dot/ com>
#
pkgname=digibyte-qt-git
_gitname=DigiByteProject
pkgver=3.0.2.r4.g65e1f9e
pkgrel=1
pkgdesc="A Professional and Transparent Cryptocurrency."
arch=('x86_64' 'i686')
url="http://digibyte.co/"
license=('MIT')
provides=('digibyte-qt-git')
conflicts=('digibyte-qt-git')
depends=('qt4' 'miniupnpc' 'qrencode' 'boost-libs')
makedepends=('git' 'boost' 'gcc' 'make' 'protobuf')
source=('git://github.com/digibyte/DigiByteProject'
        'digibyte.desktop')
install=digibyte.install
sha256sums=(SKIP 
            '412abfb7282ec9943ea59d55dba306bbbf9dc47e780fd17fa47c1222ab0bdbe7')

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_gitname}/

	./autogen.sh
	./configure --with-incompatible-bdb \
				--enable-upnp-default \
		    	--with-gui \
		    	--without-cli
	make
}

package() {
	cd ${srcdir}
	install -Dm644 digibyte.desktop ${pkgdir}/usr/share/applications/digibyte.desktop

	cd ${_gitname}/src
	install -Dm755 digibyted ${pkgdir}/usr/bin/digibyted
	install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cd qt
	install -Dm755 digibyte-qt ${pkgdir}/usr/bin/digibyte-qt
	install -Dm644 res/icons/bitcoin.png ${pkgdir}/usr/share/pixmaps/digibyte.png
}

