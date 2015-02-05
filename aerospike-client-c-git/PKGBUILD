# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=aerospike-client-c-git
pkgver=3.1.0.r0.gdb9f82a
pkgrel=1
pkgdesc="SSD optimized NoSQL key-value store. Client"
arch=('i686' 'x86_64')
url='http://www.aerospike.com'
license=('Apache')
depends=('openssl' 'lua')
provides=('aerospike-client-c')
makedepends=('git')
source=("$pkgname"::git+https://github.com/aerospike/aerospike-client-c#branch=master
        'Makefile-proper-install-target.patch'
        'fix-mkdir.patch')
sha256sums=('SKIP'
            '99492dab259f2627fd5526ba9279dd84462b4de3b248beb9c073ce545ddb9c26'
            '67a8df70f65b41ff11d8e7bfc5efc4aea8c881ba5ff4e86f83d5a0fd5c81b4a2')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	git am --signoff < ../Makefile-proper-install-target.patch
	git am --signoff < ../fix-mkdir.patch
	git submodule update --init
}

build() {
	cd "${srcdir}/${pkgname}"
	make -j1
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} install
}
