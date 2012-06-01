pkgname=moxi
_pkgbase=couchbase-server
pkgver=1.7.2
_pkgbasever=1.8.0
pkgrel=1
pkgdesc="Memcached proxy with energy and pep"
url='http://www.couchbase.com/'
arch=('i686' 'x86_64')
license=('MIT' 'Apache')
depends=('libconflate' 'libvbucket' 'libevent' 'libmemcached')
makedepends=('check>=0.9.4')
source=("http://packages.couchbase.com/releases/1.8.0/${_pkgbase}_src-${_pkgbasever}.tar.gz")
md5sums=('b0d7504fa4600d198f5c55b3944e244a')

build() {
	cd "${srcdir}/${_pkgbase}_src/moxi"
	./configure --prefix=/usr --localstatedir=/var --enable-moxi-libvbucket
	make
}

package() {
	cd "${srcdir}/${_pkgbase}_src/moxi"
	make DESTDIR="${pkgdir}" install
}
