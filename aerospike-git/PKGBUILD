# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=aerospike-git
pkgver=3.3.26.r0.ge87d8a0
pkgrel=1
pkgdesc="SSD optimized NoSQL key-value store. Community edition."
arch=('i686' 'x86_64')
url='http://www.aerospike.com'
license=('AGPL3' 'Apache' 'custom')
depends=('openssl' 'jansson' 'jemalloc' 'lua' 'luajit')
provides=('aerospike')
makedepends=('git')
source=("$pkgname"::git+https://github.com/aerospike/aerospike-server#branch=master
        'link-to-libluajit-5.1.patch')
sha256sums=('SKIP'
            '1765bde39e902a3c8e6128cce10964736a4570e48bc5c7fc24c5db967430cc7b')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
	git am --signoff < ../link-to-libluajit-5.1.patch
	git submodule update --init
}

build() {
	cd "${srcdir}/${pkgname}"
  make LD_CRYPTO=dynamic LD_JANSSON=dynamic LD_JEM=dynamic LD_LUAJIT=dynamic LD_LUA=dynamic
}

package() {
	cd "${srcdir}/${pkgname}/pkg/tar"
  make TARGET="${pkgdir}/usr" dist
	rm "${pkgdir}/usr/LICENSE"
	rm "${pkgdir}/usr/README"

	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
