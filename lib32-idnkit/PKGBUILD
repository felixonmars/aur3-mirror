# Maintainer: Bill Fraser <wfraser@codewise.org>

_pkgbasename=idnkit
pkgname=lib32-idnkit
pkgver=1.0
pkgrel=1
pkgdesc='Provides functionalities about Internationalized Domain Name processing'
arch=('x86_64')
url='http://www.nic.ad.jp/ja/idn/idnkit/download/'
license=('custom:BSD')
options=('!makeflags' '!libtool')
source=("http://www.nic.ad.jp/ja/idn/idnkit/download/sources/idnkit-${pkgver}-src.tar.gz")
sha1sums=('7d843ffcf9843b7af02079e5a160520f28c75048')
depends=($_pkgbasename)

build() {
        export CC="gcc -m32"
        export LD="ld -m32"

	cd "${srcdir}/idnkit-${pkgver}-src"
	./configure \
		--prefix=/usr \
                --libdir=/usr/lib32 \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--mandir=/usr/share/man \
		--enable-static=no
	make
}

package() {
	cd "${srcdir}/idnkit-${pkgver}-src"
	make DESTDIR="${pkgdir}" install
        rm -r ${pkgdir}/etc
        rm -r ${pkgdir}/usr/{bin,include,share}
        mkdir -p ${pkgdir}/usr/share/licenses
        ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}
