# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: catweazle
# Contributor: rankin

pkgname=poppler-qt3
pkgver=0.16.7
pkgrel=1
pkgdesc="Poppler Qt3 bindings"
arch=(i686 x86_64)
license=('GPL')
depends=('qt3>=3.3.8' "poppler>=${pkgver}")
makedepends=('pkgconfig')
options=('!libtool')
url="http://poppler.freedesktop.org/"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.gz
	poppler-bindings.patch)
sha256sums=('fab4e8af2d34d4142a718819fd747d40930b71ef520ee0e6bcc94e2c44f22bcd'
            '0f9fa33dca271c6c0e31d66cce1847099b63c1443a002aa9bde99a8cb20ad770')

build() {
  . /etc/profile.d/qt3.sh

  cd "${srcdir}/poppler-${pkgver}"

  patch -Np2 -i ../poppler-bindings.patch

  libtoolize --force --copy
  AT_M4DIR="m4" autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --enable-zlib \
              --enable-libjpeg \
              --enable-cairo-output \
              --enable-poppler-qt \
              --disable-poppler-glib \
              --disable-gtk-test \
              --disable-poppler-qt4
  sed -i -e 's|^LDFLAGS =|LDFLAGS = -L/opt/qt/lib -lqt-mt|' qt/Makefile
  pushd poppler
  make libpoppler-cairo.la
  popd
  make
}

package() { 
  cd "${srcdir}/poppler-${pkgver}"
 make DESTDIR="${pkgdir}" install
}
