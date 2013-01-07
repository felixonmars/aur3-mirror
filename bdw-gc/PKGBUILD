# Maintainer: nandub <dev@nandub-dev.tk>
pkgname=bdw-gc
pkgver=7.2
_pkgver_file=${pkgver}d
pkgrel=4
pkgdesc="A garbage collector for C and C++"
url="http://www.hpl.hp.com/personal/Hans_Boehm/gc"
license=('GPL')
depends=(gcc-libs)
conflicts=(gc)
source=(http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-$_pkgver_file.tar.gz)
md5sums=('91340b28c61753a789eb6077675d87d2')
arch=('i686' 'x86_64')

build() {
  pushd "${srcdir}/gc-$pkgver" || return 1
    ./configure --enable-cplusplus --prefix=/usr  || return 1
    make || return 1
    make check || return 1
    make DESTDIR="$pkgdir/" install
  popd || return 1
}
