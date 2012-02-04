# Maintainer: Antony Male <antony dot mail at gmail dot com>
# Contributer: Alper KANAT <alperkanat@raptiye.org>

pkgname=gitosis-wildcard
pkgver=20110207
pkgrel=1
pkgdesc="An application to help make hosting git repos easier and safer, with wildcard support"
url="http://zcentric.com/2010/08/25/gitosis-with-wildcard-support"
arch=('any')
license=('GPL2')
makedepends=('git' 'python2' 'python2-distribute')
conflicts=('gitosis', 'gitosis-git')
provides=('gitosis')
install=('gitosis.install')

_gitroot="git://github.com/mzupan/gitosis.git"
_gitname="gitosis"

build() {
	cd "$srcdir"
	msg "Connecting to gitosis git server..."

	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	cd "$srcdir/$_gitname"
	python2 setup.py build
}
package() {
	cd "$srcdir/$_gitname"
	python2 setup.py install --root=${pkgdir}

	# example configs
	install -Dm644 "${srcdir}/${_gitname}/README.rst" "${pkgdir}/usr/share/doc/${_gitname}/README.rst"
	install -Dm644 "${srcdir}/${_gitname}/example.conf" "${pkgdir}/usr/share/doc/${_gitname}/example.conf"
	install -Dm644 "${srcdir}/${_gitname}/gitweb.conf" "${pkgdir}/usr/share/doc/${_gitname}/gitweb.conf"
	install -Dm644 "${srcdir}/${_gitname}/lighttpd-gitweb.conf" "${pkgdir}/usr/share/doc/${_gitname}/lighttpd-gitweb.conf"
}
