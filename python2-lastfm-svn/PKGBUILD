# Maintainer: David "Naypam" Trail <arch@trailbeans.eu>

_pkgname=python2-lastfm
pkgname=python2-lastfm-svn
pkgver=0.1.0
pkgrel=1
pkgdesc="Python last.fm module"
arch=(any)
url="https://code.google.com/p/python-lastfm/"
license=('BSD')
depends=('python2')
makedepends=('svn')
provides=('python2-lastfm')
conflicts=('python2-lastfm')
source=()
md5sums=()

package() {
	svn checkout http://python-lastfm.googlecode.com/svn/trunk/ $_pkgname
	cd $_pkgname
	
    python2 setup.py build
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set noet:
