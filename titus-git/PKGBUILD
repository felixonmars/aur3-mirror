# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='titus-git'
pkgdesc='Totally Isolated TLS Unwrapping Server'
url='https://www.opsmate.com/titus/'
license='MIT'
pkgver=0.1.r4.gd7f5db7
pkgrel=1
arch=('i686' 'x86_64' 'arm')
depends=('openssl>=1.0.1f')
sha512sums=('SKIP')
source=("${pkgname}::git+https://agwa.name/git/titus.git")
options=('zipman')

pkgver () {
	cd "${pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	cd "${pkgname}"
	make
}

package () {
	cd "${pkgname}"
	install -Dm755 titus "${pkgdir}/usr/bin/titus"
	install -Dm644 titus.8 "${pkgdir}/usr/share/man/man8/titus.8"
	install -Dm644 titus.conf.example "${pkgdir}/etc/titus.conf.example"
}
