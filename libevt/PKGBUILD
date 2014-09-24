# Maintainer: Jeremy M. <jskier at gmail dot com>
# Contributor: Jeremy M. <jskier at gmail dot com>

pkgname=libevt
pkgver=20140831
pkgrel=1
pkgdesc="Library and tooling to access the Windows Event Log (EVT) format"
url="https://code.google.com/p/libevt/"
license=('Lesser GPL')
arch=('i686' 'x86_64')
depends=('python')
options=()
source=(https://googledrive.com/host/0B3fBvzttpiiSYm01VnUtLXNUZ2M/${pkgname}-alpha-${pkgver}.tar.gz)
md5sums=('981984df3fedd82d409137b1e3b8e249')

build() {
	  cd "$srcdir"/${pkgname}-${pkgver}
	    ./configure --prefix=/usr
	      make
}

package() {
	        cd "$srcdir"/${pkgname}-${pkgver}
		  make DESTDIR="${pkgdir}" install
}
