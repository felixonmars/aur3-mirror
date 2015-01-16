pkgname=tldr
pkgdesc='C++ command line client for the tl;dr man-pages'
pkgrel=1
pkgver=0.2
url='https://github.com/tldr-pages/tldr-cpp-client'
arch=('x86_64' 'i686')
license=('MIT')
source='git+https://github.com/tldr-pages/tldr-cpp-client.git#tag=0.2'
makedepends=('clang' 'git')
depends=('curl')
sha1sums=('SKIP')

build() {
	cd "${srcdir}/tldr-cpp-client"
	make -C src
}

package() {
	cd "${srcdir}/tldr-cpp-client"
	make PREFIX="${pkgdir}/usr" -C src install
	install -d "${pkgdir}"/usr/share/{doc,licenses}/"${pkgname}"
	pwd
	install -pm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
	install -pm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
}
