# Maintainer: Zifei Tong <soariez@gmail.com>

# pokeuser patch by William Cohen
# from http://pkgs.fedoraproject.org/cgit/dyninst.git/commit/?id=9a7f0c025aa500f73127fa5b72561b5b62ba1e11

pkgname=dyninst
pkgver=8.1.2
pkgrel=3
pkgdesc="An API for run-time code generation"
url="http://www.dyninst.org"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('boost' 'libdwarf')
install="dyninst.install"
source=("http://www.dyninst.org/sites/default/files/downloads/${pkgname}/${pkgver}/DyninstAPI-${pkgver}.tgz"
        "dyninst_linux-vdso.patch"
        "dyninst-pokeuser.patch")
sha1sums=('0bda1b08bea34ddda6fbcfd94622beb54b816acf'
          '58475c200cec5e7aad75e4c44e9309d020153f3e'
          '02a28522f77f7ddd116e8f7ef0ff4fe07216226a')

build() {
  cd "$srcdir/DyninstAPI-$pkgver"
  patch -Np1 -i $srcdir/dyninst_linux-vdso.patch
  patch -Np1 -i $srcdir/dyninst-pokeuser.patch
  ./configure --includedir=/usr/include/dyninst
  make
}

package() {
  cd "$srcdir/DyninstAPI-$pkgver"
  make DESTDIR="$pkgdir" install

  chmod 644 $pkgdir/usr/include/dyninst/*
  chmod 644 $pkgdir/usr/lib/*.a
}
