# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Kohei Ozaki <eow.ner+aur@gmail.com>
pkgname=lib32-google-gflags
pkgver=2.0
pkgrel=1
pkgdesc="Commandline flags module for C++ (32-bit)"
arch=(x86_64)
license=('BSD3')
url="http://code.google.com/p/google-gflags/"
depends=('lib32-gcc-libs' "google-gflags=${pkgver}")
makedepends=('make' 'gcc-multilib')
options=('!libtool')
source=(https://gflags.googlecode.com/files/gflags-${pkgver}.tar.gz)
md5sums=('e02268c1e90876c809ec0ffa095da864')

build() {
  cd ${startdir}/src/gflags-${pkgver}

  export CFLAGS="-m32"
  export CXXFLAGS="-m32"

  ./configure --prefix=/usr --libdir=/usr/lib32 --program-prefix=lib32- || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

package() {
    cd "$srcdir/gflags-$pkgver"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/include"
    rm -r "$pkgdir/usr/share"
}
