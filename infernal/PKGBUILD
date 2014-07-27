# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=infernal
pkgver=1.1.1
pkgrel=1
pkgdesc='An implementation of covariance models (CMs)'
arch=('i686' 'x86_64')
url="http://infernal.janelia.org/"
license=('GPL3')
depends=('glibc')
source=("http://selab.janelia.org/software/infernal/infernal-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/infernal-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/infernal-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 Userguide.pdf "${pkgdir}/usr/share/doc/${pkgname}/Userguide.pdf"
}

md5sums=('c5bff318f78c194a0d9b2a6bf1abb169')
