# Maintainer: CyrIng <xfreq[at]cyring.fr>
 
pkgname=xfreq-intel-git
_pkgname=xfreq
_branch=2.0
pkgver=55.7fe7aa8
pkgrel=1
pkgdesc="Intel Core Monitoring Server"
arch=('x86_64')
url="http://code.google.com/p/xfreq/"
license=('GPL2')
makedepends=('git')
conflicts=('xfreq-git' 'xfreq')
source=("git+https://code.google.com/p/xfreq#branch=$_branch")
md5sums=('SKIP')
install=readme.install
 
pkgver() {
	cd "$srcdir/$_pkgname/$_branch"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}
 
build() {
	cd "$srcdir/$_pkgname/$_branch/svr"
	make
	cd ../cli
	make
	cd ../gui
	make
}
 
package() {
	cd "$srcdir/$_pkgname/$_branch"
	install -Dm755 svr/bin/xfreq-intel "${pkgdir}/usr/bin/xfreq-intel"
	install -Dm644 svr/xfreq-intel.service "${pkgdir}/usr/lib/systemd/system/xfreq-intel.service"
	install -m755 cli/bin/xfreq-cli "${pkgdir}/usr/bin/xfreq-cli"
	install -m755 gui/bin/xfreq-gui "${pkgdir}/usr/bin/xfreq-gui"
}
