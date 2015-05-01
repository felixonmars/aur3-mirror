# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=gd
pkgname=lib32-${_pkgbase}
pkgver=2.1.1
pkgrel=1
pkgdesc="Library for the dynamic creation of images by programmers (32 bit)"
arch=('x86_64')
url="http://www.libgd.org/"
license=('custom')
depends=('lib32-fontconfig' 'lib32-libvpx' 'lib32-libxpm' 'lib32-libtiff' "${_pkgbase}")
makedepends=('gcc-multilib') #perl
options=('!libtool')
source=("${_pkgbase}::git+https://github.com/libgd/libgd.git#tag=${_pkgbase}-${pkgver}"
        gd-2.1.1-libvpx-1.4.0.patch)
md5sums=('SKIP'
         '9114dd8259aaa88b0a09188fe7b19afc')

prepare() {
  cd ${_pkgbase}
  ./bootstrap.sh
  patch -p1 -i "${srcdir}/gd-2.1.1-libvpx-1.4.0.patch"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'  
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgbase}
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-rpath \
    --with-vpx=/usr \
    --with-tiff=/usr
  make
}

package() {
  cd ${_pkgbase}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  rm -rf "$pkgdir/usr/include"
  # Config script pointing libdir to /usr/lib32 (lib32-libgphoto2 needs it)
  mv "$pkgdir/usr/bin/gdlib-config"{,-32}
  find "$pkgdir/usr/bin" -type f ! -name "gdlib-config-32" -exec rm {} \;
}
