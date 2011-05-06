# Contributor: Chris Down <cdown.uk@gmail.com>
# Maintainer: Chris Down <cdown.uk@gmail.com>

pkgname=ghoul
pkgver=1.0
pkgrel=1
pkgdesc="rc.d-style daemon manipulator."
arch=('any')
url="https://github.com/cdown/${pkgname}"
license=('GPL3')
source=("http://fakkelbrigade.eu/chris/aur/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('27bf30129a3577a4f1bb34d0208569d6')

build() {
	# Program
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d "${pkgdir}/usr/bin/"
	install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Man page
	pod2man --section=1 --center=' ' --name="${pkgname^^}" --release="${pkgname} ${pkgver}" "README.pod" "${pkgname}.1"
	gzip -9 "${pkgname}.1"
	install -Dm644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
