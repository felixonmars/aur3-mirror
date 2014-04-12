# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=lib32-gc
pkgver=7.4.0
pkgrel=1
pkgdesc="A garbage collector for C and C++"
arch=('x86_64')
license=('GPL')
groups=('lib32')
depends=('lib32-gcc-libs' 'lib32-libatomic_ops')
url="http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
source=(http://www.hboehm.info/gc/gc_source/gc-${pkgver}.tar.gz)

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/gc-${pkgver}"
  ./configure --prefix=/usr --enable-cplusplus \
              --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/gc-${pkgver}"

  make DESTDIR="${pkgdir}" install 
  rm -rf "${pkgdir}"/usr/{share,include}
}

md5sums=('f40d9a47c90d60791eeecb484f8df5ee')
