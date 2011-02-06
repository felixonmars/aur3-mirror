# Maintainer: Chuck Atkins <chuckatkins at gmail dot com>

pkgname=gstreamermm0.10
pkgver=0.10.5.2
pkgrel=2
pkgdesc="C++ language bindings for the GStreamer multimedia framework"
arch=(i686 x86_64)
license=(LGPL)
url="http://gstreamer.freedesktop.org/bindings/cplusplus.html"
groups=('multimedia')
depends=('gstreamer0.10' 'glibmm>=2.18.1' 'libsigc++2.0' 'libxml++>=2.14.0')
source=(http://ftp.gnome.org/pub/GNOME/sources/gstreamermm/0.10/gstreamermm-${pkgver}.tar.bz2)
md5sums=('aa6ffc7f744048d442e20ed9fcb5068b')
sha1sums=('512fbd839b07191b977b7363753331f7115f9053')
sha256sums=('18655510bb02b4054ce811135d61ec8578d0009f8434ba3b154ed48f226674c6')
sha384sums=('ff49aecb9a9abb14283b573a0542aefbd5bd48a1d1ec67d99ca2d34faa02f5e7ab26cce06d0af2e9548a7dca08a3da9c')
sha512sums=('643075cdbe553a362613eaf41c2f2be3f66acc5a88482f687bf7c181a5f4038a6a998087883b2cf8bb1aa4a07d6959132b03c3214f80596d0f64a2c38ce95180')

build() {
  cd ${srcdir}/gstreamermm-${pkgver}
  ./configure --prefix=/usr --disable-examples
  make
  make DESTDIR="${pkgdir}" install 
}

