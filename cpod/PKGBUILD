# Maintainer: nmeum <nmeum-aur@8pit.net>

pkgname=cpod
pkgver=1.5
pkgrel=1
pkgdesc="Yet another cron friendly podcatcher."
url="http://github.com/nmeum/${pkgname}"
license=("GPL")
arch=("i686" "x86_64")
makedepends=("go")
source=("https://github.com/nmeum/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("2f46e4095b24ce4d221e5254f8512787b5ea08e635ef86e29b15de08458a23c1")
_godir="go-src/src/github.com/nmeum"

prepare() {
	mkdir -p "${_godir}"
	ln -snf "../../../../${pkgname}-${pkgver}" "${_godir}/${pkgname}"
}

build() {
	cd "${srcdir}/${_godir}/${pkgname}"
	export GOPATH="${srcdir}/go-src"

	go build -o "${pkgname}"
	pod2man --section=1 --center="${pkgname} Manual" \
		--name="${pkgname}" --release="${pkgname} ${pkgver}" README.pod > "${pkgname}.1"
}

package() {
	cd "${srcdir}/${_godir}/${pkgname}"
	install -Dm755 "${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}".1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
