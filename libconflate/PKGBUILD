pkgname=libconflate
_pkgbase=couchbase-server
pkgver=1.8.0
pkgrel=1
pkgdesc="XMPP client library"
url='http://www.couchbase.com/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libstrophe-git' 'curl')
makedepends=('check')
source=("http://packages.couchbase.com/releases/1.8.0/${_pkgbase}_src-${pkgver}.tar.gz")
md5sums=('b0d7504fa4600d198f5c55b3944e244a')

build() {
	cd "${srcdir}/${_pkgbase}_src/libconflate"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgbase}_src/libconflate"
	make DESTDIR="${pkgdir}" install
}
