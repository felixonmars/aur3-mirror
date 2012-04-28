# Maintainer: Gabriel Pickl <gabriel@syntax-austria.org>
pkgname=restauth-common-git
pkgver=20120428
pkgrel=1
pkgdesc="Restauth is a webservice providing shared authorization, authentication and preferences."
url="http://server.restauth.net"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('python2')
optdepends=()
makedepends=('git' 'python2' )
provides=('restauth-common')
conflicts=()
replaces=()
backup=()
#install=''

_gitroot="http://git.fsinf.at/restauth/restauth-common.git"
_gitname="restauth"
 
build() {
	cd "$srcdir"
	msg "Connecting to GIT Server..."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files have been updated"
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make"

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	python2 setup.py build
	msg "Starting test"
}
 
package() {
  cd "${srcdir}/$_gitname-build"
  python2 setup.py install --prefix "${pkgdir}/usr"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
