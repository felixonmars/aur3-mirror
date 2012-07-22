# Maintainer: theluda <theluda@getmangos.com>
pkgname=smpq
pkgver=1.4
pkgrel=3
pkgdesc="StormLib MPQ archiving utility"

arch=('i686' 'x86_64')
url="https://launchpad.net/smpq/"
license=('GPL3')

depends=('stormlib-git')
makedepends=('cmake')

source=(
    https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.orig.tar.gz
    find-stormlib.patch
    streamflags-stormlib.patch
    )
md5sums=(
    '725d4c74fe78031770c759dcd2e27338'
    '6fa8fc69dc7f03ca094cefb2952d83bb'
    '6ca77538655d8383bdebaeb26f60bc65'
    )

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch -p1 -i $srcdir/find-stormlib.patch
    patch -p1 -i $srcdir/streamflags-stormlib.patch

	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake ../${pkgname}-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_KDE=OFF || return 1
	make || return 1
}

package() {
	cd "${srcdir}/build"
	make DESTDIR=${pkgdir} install
}
