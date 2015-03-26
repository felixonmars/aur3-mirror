# Maintainer: Plamen Semerdzhiev <pl.semerdzhiev@gmail.com>
pkgname=pcloud-git
pkgver=3.0.1
pkgrel=1
pkgdesc="pCloud Drive client"
arch=('x86_64')
url="http://pcloud.com"
license=('unknown')
depends=()
makedepends=('tar'
	'deb2targz')
provides=('psyncgui')
conflicts=()
replaces=()
source="git://github.com/plamens/pcloud.git"
md5sums=('SKIP')

package() {
	cd "$srcdir"/pcloud
	deb2targz pCloud_Linux_amd64_3.0.1.deb
	tar -xf pCloud_Linux_amd64_3.0.1.tar.gz
	mkdir "$pkgdir"/usr
	mkdir "$pkgdir"/usr/bin
	cp usr/bin/psyncgui "$pkgdir"/usr/bin/psyncgui
}