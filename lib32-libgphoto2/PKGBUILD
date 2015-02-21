# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: Le Duc Hieu <alaviss0 at gmail dot com>

_pkgbase=libgphoto2
pkgname=lib32-${_pkgbase}
pkgver=2.5.7
pkgrel=1
pkgdesc="The core library of gphoto2, designed to allow access to digital camera by external programs. (32 bit)"
arch=('x86_64')
url="http://www.gphoto.org"
license=(LGPL)
depends=('lib32-avahi' 'lib32-libexif' 'lib32-libxml2' 'lib32-gd' 'lib32-libltdl' 'lib32-libusb' "${_pkgbase}=$pkgver")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/gphoto/${_pkgbase}-${pkgver}.tar.bz2")
sha1sums=('0f0ebe1c953eab598c6a53477b81be762ab9047f')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-rpath \
    --with-libusb=no
  make
}

package() {
  make -C "${srcdir}/$_pkgbase-$pkgver" DESTDIR="${pkgdir}" install
  # Remove unwanted dirs
  rm -rf "${pkgdir}"/usr/{bin,include,share,lib32/udev}
}
