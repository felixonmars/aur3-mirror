# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=lib32-libgsf
pkgver=1.14.30
pkgrel=1
pkgdesc="The GNOME Structured File Library is a utility library for reading and writing structured file formats."
arch=('x86_64')
url="http://www.gnome.org/"
license=('GPL' 'LGPL')
depends=('libgsf' 'lib32-glib2' 'lib32-libxml2' 'lib32-bzip2')
makedepends=('gcc-multilib' 'intltool')
source=("http://ftp.gnome.org/pub/GNOME/sources/libgsf/1.14/libgsf-$pkgver.tar.xz")
md5sums=('e7b672ef37ef6a853ce149c03e4d3a63')

prepare() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
}

build() {
  cd libgsf-$pkgver
  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --sysconfdir=/etc \
              --mandir=/usr/share/man \
              --localstatedir=/var \
              --enable-static=no
  make 
}

package() {
  cd libgsf-$pkgver
  make DESTDIR="$pkgdir/" install-pkgconfigDATA
  make DESTDIR="$pkgdir/" install-libLTLIBRARIES -C gsf
}
