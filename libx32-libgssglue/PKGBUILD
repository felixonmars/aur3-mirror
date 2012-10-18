# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Upstream Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: Fantix King <fantixking at gmail.com>

_pkgbase=libgssglue
pkgname=libx32-${_pkgbase}
pkgver=0.4
pkgrel=1.1
pkgdesc="Exports a gssapi interface which calls other random gssapi libraries (x32 ABI)"
arch=('x86_64')
url="http://www.citi.umich.edu/projects/nfsv4/linux"
license=('BSD')
depends=('libx32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=($url/$_pkgbase/$_pkgbase-$pkgver.tar.gz)
md5sums=('088797f3180702fa54e786496b32e750')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir/" install
  rm -rf "${pkgdir}"/usr/include
  
  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s $_pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}
