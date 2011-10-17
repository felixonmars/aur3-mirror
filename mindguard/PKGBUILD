pkgname=mindguard
pkgver=0.0.0.4
pkgrel=2
pkgdesc="MindGuard is a program that protects your mind. Package includes the latest carriers"
arch=('i686' 'x86_64')
license=("MGPL")
url="http://zapatopi.net/mindguard/"
makedepends=('gtk>=1.2')
depends=('gtk>=1.2')
_carriersver=20090121
source=(http://zapatopi.net/mindguard/${pkgname}-${pkgver}.tgz
        http://zapatopi.net/mindguard/carriers/carriers.${_carriersver}.tgz
        Makefile.patch)
md5sums=('06ea4e08df9e414557ee5a28d64439bb'
		 '4ebf19ff03191d286d7ee1ecfbc0d1c4'
		 '116e36823e4c8ca5f8906e57725b3be4')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	patch -p0 -i ${startdir}/Makefile.patch
	make || return 1
	make DESTDIR=${startdir}/pkg/usr/local install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${pkgdir}/usr/local/share/MindGuard/carriers"
	tar xvf "${startdir}/carriers.${_carriersver}.tgz"
}
