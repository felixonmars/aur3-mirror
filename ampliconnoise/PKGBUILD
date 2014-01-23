# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ampliconnoise
pkgver=1.29
pkgrel=1
pkgdesc="A collection of programs for the removal of noise from 454 sequenced PCR amplicons"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ampliconnoise/"
license=('LGPL3')
depends=('gsl' 'hwloc' 'mafft' 'openmpi')
source=("http://ampliconnoise.googlecode.com/files/AmpliconNoiseV${pkgver}.tar.gz")

build() {
	cd "${srcdir}/AmpliconNoiseV${pkgver}"
	make
	make install
}

package() {
	cd "${srcdir}/AmpliconNoiseV${pkgver}"
	
	install -dm755 "$pkgdir/usr"
	cp -r bin "$pkgdir/usr"
	
	install -Dm644 Doc.pdf "${pkgdir}/usr/share/doc/${pkgname}/Doc.pdf"
	
	mkdir "$pkgdir/usr/share/${pkgname}"
	cp -r Data "$pkgdir/usr/share/${pkgname}"
	cp -r Scripts "$pkgdir/usr/share/${pkgname}"
}

md5sums=('d6723e6f9cc71d7eb6f1a65ba4643aac')
