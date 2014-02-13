# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=pacls-git
pkgver=r9.1cf2234
pkgrel=1
pkgdesc="A pacman parser with focus on robust search and easy readability."
arch=('any')
license=('GPL2')
depends=('bash' 'cower')
url="https://github.com/gabbagabbahey/pacls"
provides=("pacsearch")
source=('git://github.com/gabbagabbahey/pacls.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pacls"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

	cd "${srcdir}/pacls"

}

package() {

	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/pacls/pacls" "${pkgdir}/usr/bin/"
	chmod 755 "${pkgdir}/usr/bin/pacls"

}
