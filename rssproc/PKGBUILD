#Author/maintainer : ahmet emre <aecepoglu at gmail>

pkgname="rssproc"
pkgrel=1
pkgver="0.0"
pkgdesc="A minimal tool that reads rss data and prints items in a desired format"
url="http://bitbucket.org/aecepoglu/rssproc"
license=('GPL')
arch=("i686" "x86_64" "armv6h")
depends=("expat")
provides=("rssproc")
conflicts=("rssproc-hg")
makedepends=("git")
_gitroot="https://bitbucket.org/aecepoglu"
_gitrepo="rssproc"
source=("git+$_gitroot/$_gitrepo")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/${_gitrepo}
	git describe --abbrev=0
}

build() {
	cd $srcdir/${_gitrepo}
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/${_gitrepo}
	make DESTDIR="$pkgdir/usr/bin" install
}
