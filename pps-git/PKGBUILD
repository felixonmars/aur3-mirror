# Maintainer: Àlex Ramírez Gómez <alexandre.ramirez@est.fib.upc.edu>
pkgname='pps-git'
_gitname='pps'
pkgver=20150322
pkgrel=14
pkgdesc="Search and download files from torrent trackers from the command line."
arch=('any')
url='https://github.com/badarg/pps'
license=('Apache')
depends=('perl' 'perl-libwww')
makedepends=('git')
options=(!emptydirs)
source=('git://github.com/badarg/pps.git')
md5sums=('SKIP')

_gitroot='https://github.com/badarg/pps.git'

pkgver() {
#	cd local_repo
#	git describe --always | sed 's|-|.|g'
#	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
	date %Y%m%d
}
build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"
}
package() {
	cd "$srcdir/$_gitname"
	install -D pps.pl "$pkgdir/usr/bin/pps"
	install -D plugins/TPB.pm "$pkgdir/usr/lib/pps/TPB.pm"
	install -D plugins/KAT.pm "$pkgdir/usr/lib/pps/KAT.pm"
}

