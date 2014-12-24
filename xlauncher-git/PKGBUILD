#Maintainer: Niels Neumann <vatriani[dot]nn[at]googlemail[dot]com>
pkgname=xlauncher-git
pkgdesc="simple and fast launcher for x11"
pkgver=0.3.0
pkgrel=2
url="https://github.com/vatriani/xlauncher"
arch=('any')
license=('GPLv3')
depends=('libx11')

source=("https://github.com/vatriani/xlauncher/archive/v0.3-beta.tar.gz")

md5sums=('406480a9772f0bd76990cef4ef7252f4')

build() {
	cd ${srcdir}/xlauncher-0.3-beta
	make
}

package() {
	cd ${srcdir}/xlauncher-0.3-beta
	install -Dm777 xlauncher "$pkgdir/usr/bin/xlauncher"
}
