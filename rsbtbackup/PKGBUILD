# Maintainer: Adrien Ferrand <h 4 d r i e n @ g m a i l . c o m>

pkgname=rsbtbackup
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple incremental backup tool which uses the incremental snapshot capability of Btrfs subvolumes."

arch=('any')
url="http://github.com/fullm3tal/rsbtbackup"

license=('GPL')
depends=('python' 'btrfs-progs' 'rsync')
makedepends=('git')
provides=('rsbtbackup')
md5sums=('SKIP')

source=('rsbtbackup::git+http://github.com/fullm3tal/rsbtbackup')

build() {
	cd ${srcdir}
}

package(){
	cd "$srcdir/$pkgname"

	install -D -m755 rsbtbackup ${pkgdir}/usr/bin/rsbtbackup || return 1
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/rsbtbackup/COPYING
}
