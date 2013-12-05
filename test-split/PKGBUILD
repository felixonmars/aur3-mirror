# Maintainer: udeved <udeved@openrc4arch.site40.net>

pkgbase=test-split
pkgname=test-split
true && pkgname=('foo' 'bar2' 'test-split')
pkgver=20131204
pkgrel=1
pkgdesc="This is the test-split description. Do not install this package!"
arch=('any')
url="http://openrc4arch.site40.net"
license=('AUR')
makedepends=('openrc-base')

package_bar2() {
	true
	pkgdesc="This is the bar2 description"
	depends=("openrc-base")
}

package_foo() {
	true
	pkgdesc="This is the foo description"
	depends=("openrc-base")
}

package_test-split() {
	true
	pkgdesc="This is the test-split description. Do not install this test package!"
	depends=()
	provides=("test-split=${pkgver}")
}
