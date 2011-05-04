# Contributor: Chris Down <cdown.uk@gmail.com>
# Maintainer: Chris Down <cdown.uk@gmail.com>

pkgname=ncrast
pkgver=1.01
pkgrel=1
pkgdesc="A simple website blocker to help working concentration"
arch=('any')
url="https://github.com/cdown/${pkgname}"
license=('GPL3')
source=("http://fakkelbrigade.eu/chris/aur/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('64b35870b4cc9f455d2b4e9f3301bc34')

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
