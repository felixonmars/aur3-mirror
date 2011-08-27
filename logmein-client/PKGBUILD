# LogMeIn-client: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

basename=logmein
pkgname=${basename}-client
pkgver=1.0.387
pkgrel=1
pkgdesc="A Firefox plugin for Linux users of LogMeIn"
arch=("i686")
url="https://secure.${basename}.com/labs.asp"
license=("custom")
depends=("firefox")
options=(!emptydirs)

source=(https://secure.${basename}.com/activex/${pkgname}-${pkgver}-1.tar.gz)
sha1sums=('27dc0982bd823db05bdd2ed8e687442bd76d688b')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}-1

	# Install
	install -D libractrl.so ${pkgdir}/usr/lib/mozilla/plugins/libractrl.so
}
