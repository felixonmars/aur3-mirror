# Contributor: Xilon <xilonmu@gmail.com>
pkgname=tap
pkgver=1.01
pkgrel=1
pkgdesc='A C library for writing unit tests conforming to TAP'
arch=(i686 x86_64)
url="http://jc.ngo.org.uk/trac-bin/trac.cgi/wiki/LibTap"
license='BSD'
depends=()
makedepends=()
source=("http://people.freebsd.org/~nik/public_distfiles/${pkgname}-${pkgver}.tar.gz")
md5sums=('5b22a1e94de03c7210a7df71fa18a556')
options=(!libtool)

build() { 
	cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix='/usr' || return 1
  make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install || return 1
}

