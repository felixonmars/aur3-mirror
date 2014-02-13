# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=pacsearch-git
pkgver=r6.6908fac
pkgrel=1
pkgdesc="A pacman parser with focus on robust search and easy readability."
arch=('any')
license=('GPL2')
depends=('bash')
url="https://github.com/gabbagabbahey/pacsearch"
provides=("pacsearch")
source=('git://github.com/gabbagabbahey/pacsearch.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pacsearch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

	cd "${srcdir}/pacsearch"

}

package() {

	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/pacsearch/pacsearch" "${pkgdir}/usr/bin/"
	chmod 755 "${pkgdir}/usr/bin/pacsearch"

}
