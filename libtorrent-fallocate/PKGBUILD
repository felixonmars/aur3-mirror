# Maintainer: Juan Diego Tascon

pkgname=libtorrent-fallocate
_pkgname=libtorrent
pkgver=0.13.3
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance and good code'
url='http://libtorrent.rakshasa.no/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libsigc++2.0' 'openssl')
options=('!libtool')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("http://libtorrent.rakshasa.no/downloads/${_pkgname}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
	./configure \
		--prefix=/usr \
		--disable-debug \
        --with-posix-fallocate 

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

sha1sums=('e65a20b9e6d5c04b4e0849543d58befb60d948b7')
