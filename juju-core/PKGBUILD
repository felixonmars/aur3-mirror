# Maintainer: Jonjo McKay <jonjo@jonjomckay.com>
pkgname=juju-core
pkgver=1.19.2
pkgrel=1
pkgdesc="Open source service orchestration management tool developed by Canonical Ltd."
arch=('i686' 'x86_64')
url="https://juju.ubuntu.com"
license=('AGPL3')
makedepends=('go')
options=('strip' 'ccache')
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz")
md5sums=('c20a63ae53f75224ab02ab6387c7c3d2')

build() {
	export GOPATH="${srcdir}/${pkgname}_${pkgver}"
	go install launchpad.net/juju-core/cmd/juju
}

package() {
	install -Dm755 "${srcdir}/${pkgname}_${pkgver}/bin/juju" "${pkgdir}/usr/bin/juju"
}
