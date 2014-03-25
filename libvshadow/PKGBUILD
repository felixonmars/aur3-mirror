# Maintainer: Jeremy M. <jskier at gmail dot com>
# Contributor: Jeremy M. <jskier at gmail dot com>

pkgname=libvshadow
pkgver=20140323
pkgrel=1
pkgdesc="Collection of digital forensics tools to analyze and mount Windows Volume Shadow copies"
url="https://code.google.com/p/libvshadow/"
license=('Lesser GPL')
arch=('i686' 'x86_64')
depends=('fuse' 'python')
options=()
source=(https://googledrive.com/host/0B3fBvzttpiiSZDZXRFVMdnZCeHc/${pkgname}-alpha-${pkgver}.tar.gz)
md5sums=('7fdaff6d59dcb8d4549910f5cb89b1e8')

build() {
	  cd "$srcdir"/${pkgname}-${pkgver}
	    ./configure --prefix=/usr
	      make
}

package() {
	        cd "$srcdir"/${pkgname}-${pkgver}
		  make DESTDIR="${pkgdir}" install
}
