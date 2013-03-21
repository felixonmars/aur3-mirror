#Author/maintainer : ahmet emre <aecepoglu at gmail>

pkgname="rssproc-hg"
pkgver=11
pkgrel=1
pkgdesc="A minimal tool that reads rss data and prints items in a desired format"
url="http://bitbucket.org/aecepoglu/rssproc"
license=('GPL')
arch=("i686" "x86_64")
depends=("expat")
provides=("rssproc")
makedepends=("mercurial")

_hgroot="https://bitbucket.org/aecepoglu"
_hgrepo="rssproc"

build() {
	cd $srcdir/${_hgrepo}
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/${_hgrepo}
	make DESTDIR="$pkgdir/usr/bin" install
}

#build() {
#	hg clone ${_hgroot}${_hgrepo}
#
#	msg "Building."
#	make
#}
