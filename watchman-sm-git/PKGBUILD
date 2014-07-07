# Maintainer Jack Frost <fbt@fleshless.org>

pkgname='watchman-sm-git'
pkgdesc='A service manager for linux written in bash'
license='BSD'
pkgver=0.164
pkgrel=2
arch='any'
url='https://github.com/fbt/watchman'

provides='watchman-sm'
conflicts='watchman-sm'

optdepends=( 'watchman-sm-services-git: example scripts that mostly work out of the box on arch' )

source=( "${pkgname}::git://github.com/fbt/watchman.git" )
md5sums='SKIP'

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "0.`git rev-list HEAD | wc -l`"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make USR=/usr DESTDIR="$pkgdir" install

	msg "$pkgdir"

	cd "$pkgdir/usr/bin"; ln -s watchman-service service
}
