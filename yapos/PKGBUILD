# Maintainer: Madek <gonzaloseguel@gmail.com>

pkgname=yapos
pkgver=0.4
pkgrel=1
pkgdesc="Small script to optimize and cleaning pacman database"
arch=('any')
license=('GPL2')
depends=('sed' 'pacman' 'bash' 'pactools')
url=('http://www.archlinux.org')

source=('yapos')
md5sums=('80285ecc651d61ffcacd00761efcf196')

build() {
	cd $srcdir
	mkdir $pkgdir/usr $pkgdir/usr/bin
	cp yapos $pkgdir/usr/bin
	chmod a+x $pkgdir/usr/bin/yapos
	return 0
}
