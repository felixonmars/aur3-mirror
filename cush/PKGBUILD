# Contributor: Chris Down <cdown.uk@gmail.com>
# Maintainer: Chris Down <cdown.uk@gmail.com>

pkgname=cush
pkgver=1.08
pkgrel=1
pkgdesc="Command line URL shortener."
arch=('any')
url="https://github.com/cdown/${pkgname}"
license=('GPL3')
source=("http://fakkelbrigade.eu/chris/aur/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('46f04d6df0f36472282f93f8dd6ad06a')

build() {
	# Program
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d "${pkgdir}/usr/bin/"
	install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Sample config
	install -d "${pkgdir}/usr/share/${pkgname}"
	install -m755 "config" "${pkgdir}/usr/share/${pkgname}"

	# Man page
	pod2man --section=1 --center=' ' --name="${pkgname^^}" --release="${pkgname} ${pkgver}" "README.pod" "${pkgname}.1"
	gzip -9 "${pkgname}.1"
	install -Dm644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
