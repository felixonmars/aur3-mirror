# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
pkgname=fprintd
pkgver=0.4.1
pkgrel=2
pkgdesc="D-Bus daemon that offers libfprint functionality"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=('GPL')
depends=('libfprint-unstable')
makedepends=('intltool' 'polkit' 'gtk-doc')
groups=('fprint')
_tarname="V_0_4_1"
source=(http://cgit.freedesktop.org/libfprint/fprintd/snapshot/${_tarname}.tar.bz2)
md5sums=('58fcac035c181dce8f49c374181aa2ae')

build() {
  cd "$srcdir/${_tarname}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/bin \
    --libdir=/lib
  make
}

package() {
  cd "$srcdir/${_tarname}"
  make DESTDIR="$pkgdir" install
}
