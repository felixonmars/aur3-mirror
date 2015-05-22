# Maintainer: <godfacker@gmail.com>

pkgname=csdr-git
pkgver=r19.4646897
pkgrel=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
url="https://github.com/simonyiszk/csdr"
arch=('x86_64' 'i686')
#license=()
#depends=()
optdepends=('rtl-sdr')
makedepends=('git' 'fftw')
#conflicts=()
#replaces=()
#backup=()
#install=
source=(${pkgname}::git+https://github.com/simonyiszk/csdr)
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
	cd "${srcdir}/${pkgname}"
 	install -Dm 0755 libcsdr.so ${pkgdir}/usr/lib/libcsdr.so
	install -Dm 0755 csdr ${pkgdir}/usr/bin/csdr
	install -Dm 0755 csdr-fm ${pkgdir}/usr/bin/csdr-fm
}

# vim: ts=2 sw=2 et: