# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=geoclue
pkgver=0.12.0
pkgrel=3
pkgdesc="Modular geoinformation service built on the D-Bus messaging system."
arch=('i686' 'x86_64')
url="http://geoclue.freedesktop.org/"
license=('LGPL')
depends=('gconf' 'gtk2' 'libsoup-gnome' 'gypsy' 'gpsd')
options=('!libtool')
source=(https://launchpad.net/geoclue/trunk/${pkgver%.*}/+download/$pkgname-$pkgver.tar.gz
        geoclue-gcc46.patch
        libgps20-compat.patch)
md5sums=('33af8307f332e0065af056ecba65fec2'
         '0cf8ecc350be702f623ed9a9715818c5'
         '56ac06e41459d576eb94504d3d4d3536')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/geoclue-gcc46.patch"
  patch -Np1 -i "$srcdir/libgps20-compat.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static \
              --enable-gtk=yes \
              --enable-conic=no \
              --enable-networkmanager=no \
              --enable-gypsy=yes \
              --enable-gpsd=yes \
              --enable-skyhook=yes
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
