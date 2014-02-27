# Maintainer Jack Frost <fbt@fleshless.org>

pkgname='zpm-git'
pkgdesc='A simple pacman/AUR/ABS wrapper'
license='BSD'
pkgver=0.2
pkgrel=1
arch='any'
url='https://github.com/fbt/zpm'
provides='zpm'
conflicts=( 'zpm' )

source=( "${pkgname}::git://github.com/fbt/zpm.git" )
md5sums='SKIP'

build() { echo 'No build required'; }

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "0.`git rev-list HEAD | wc -l`"
}

package() {
	cd "${srcdir}/${pkgname}"

	mkdir -pm755 "$pkgdir/usr/bin"
	install -Dm755 zpm "$pkgdir/usr/bin/"
}
