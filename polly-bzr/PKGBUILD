# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly-bzr
pkgver=424
pkgrel=2
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts"
arch=(any)
url="https://launchpad.net/polly"
license=('GPL')
depends=(
    python2-notify 
    python2-httplib2 
    pyxdg 
    python2-gconf 
    python2-pycurl 
    socksipy 
    python2-gtkspell 
    hspell 
    python2-keyring 
    python2-oauth2 
    python2-numpy 
    librsvg 
    python2-dbus
)
makedepends=(python2-distribute bzr)
install=$pkgname.install
source=(
    'polly-bzr::bzr+http://bazaar.launchpad.net/~conscioususer/polly/1.0'
    "$pkgname.install"
)
sha256sums=(
    'SKIP'
    'e4d7203934bf08d5c78ae8c0528d7874571f47b59d91199a4aad361d3a209a72'
)

pkgver() {
	cd $srcdir/polly-bzr
	bzr revno
}

build() {
	cd "$srcdir/polly-bzr"
	python2 setup.py build
}

package() {
	cd "$srcdir/polly-bzr"
	python2 setup.py install --skip-build -O1 --root="$pkgdir" --prefix=/usr
}

