# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andrew DeMaria <lostonamountain@gmail.com>
pkgname=lsm
pkgver=0.173
pkgrel=1
pkgdesc="LSM is a Link Status Monitor which can be used to monitor for example a Linux router/firewall connectivity"
arch=(x86_64)
url="http://lsm.foobar.fi/"
license=('GPL2')
source=(
"http://lsm.foobar.fi/download/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=("d87b3a4f2e420df3057b0b833be3ee1d32747cfcd5236a227fc2e76fa769f072")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -d ${pkgdir}/{etc/lsm,usr/{bin,share/lsm},var/lib/lsm}
	install -m0644 lsm.conf ${pkgdir}/etc/lsm
	install -m0755 lsm ${pkgdir}/usr/bin
	install -m0644 README lsm.conf.sample default_script.sample rsyslog-lsm.conf.sample ${pkgdir}/usr/share/lsm
	install -m0755 default_script shorewall_script ${pkgdir}/usr/share/lsm
}
