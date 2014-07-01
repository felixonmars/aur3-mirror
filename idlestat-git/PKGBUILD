# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=idlestat-git
pkgver=0.3.18.g0d6dd08
pkgrel=1
pkgdesc="A program to measure CPU time in idle and operating states"
arch=('i686' 'x86_64')
url="https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Tools/Idlestat"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('idlestat')
source=('git+http://git.linaro.org/power/idlestat.git')
md5sums=('SKIP')

pkgver() {
	cd "idlestat"
	git describe --tags | sed 's/-/./g' | sed 's/idlestat\.//g'
}

build() {
	cd "$srcdir/idlestat"
	make
}

package() {
	cd "$srcdir/idlestat"
	install -Dm755 idlestat "${pkgdir}/usr/bin/idlestat"
}