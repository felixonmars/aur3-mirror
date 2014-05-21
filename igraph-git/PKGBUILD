# Maintainer: amiara	 
# Contributor: amiara
pkgname=igraph-git
pkgver=1.0
pkgrel=1.2
pkgdesc='igraph library for creating and manipulating graphs'
arch=('i686' 'x86_64')
url="https://github.com/igraph/igraph"
license=('GPL')x
source=("$pkgname"::'git+https://github.com/igraph/igraph')
depends=('libxml2')
makedepends=('git')
conflicts=('igraph')
provides=('igraph')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./bootstrap.sh
	./configure
	make
}	

package() {	
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}

