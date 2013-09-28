# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=snowcp
pkgver=0.16.14_beta
pkgrel=1
pkgdesc='A fast file copy tool'
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/snowcp/"
license=('BSD')
source=("http://jaist.dl.sourceforge.jp/snowcp/59569/snowcp_${pkgver//_/-}-src.tgz")

build() {
	cd "${srcdir}/snowcp_${pkgver//_/-}-src"
	make
}

package() {
	cd "${srcdir}/snowcp_${pkgver//_/-}-src"
	install -Dm755 snowcp "${pkgdir}/usr/bin/snowcp"
	
	cd "${srcdir}/snowcp_${pkgver//_/-}-src/doc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('bfc1e1ed11b299bc335e59f69e15d0f8')