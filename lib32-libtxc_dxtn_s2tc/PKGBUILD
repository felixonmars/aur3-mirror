# Maintainer: Laurent Carlier <lordheavym@gmail.com>

_pkgbasename=libtxc_dxtn_s2tc
pkgname=lib32-$_pkgbasename
pkgver=0.0.20130326
pkgrel=1
arch=('x86_64')
pkgdesc="A replacement for the texture compression library for Mesa (32-bit)"
url="https://github.com/divVerent/s2tc"
license=(MIT)
depends=('lib32-mesa' 'lib32-gcc-libs' 'libtxc_dxtn_s2tc')
options=(!libtool)
provides=('lib32-libtxc_dxtn')
conflicts=('lib32-libtxc_dxtn')
source=(dxtn_s2tc.zip::https://github.com/divVerent/s2tc/archive/master.zip)
md5sums=('e45a1c15f690ca5bed42d8bc07ae51c1')

build() {
  cd "$srcdir"/s2tc-master

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  sh autogen.sh
  ./configure --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir"/s2tc-master

  make DESTDIR="$pkgdir" install
  
  rm -r "$pkgdir"/usr/{bin,include}
}
