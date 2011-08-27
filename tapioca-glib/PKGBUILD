# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=tapioca-glib
pkgver=0.14.0.1
pkgrel=5
pkgdesc="Core Tapioca library."
arch=('i686' 'x86_64')
url="http://tapioca-voip.sourceforge.net/"
license=('GPL')
depends=('dbus-glib')
makedepends=('autoconf' 'automake' 'gcc' 'gtk-doc' 'libtool' 'make' 'patch' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/tapioca-voip/${pkgname}-${pkgver}.tar.gz \
	${pkgname}-tpafix.diff)
md5sums=('306d1ae5bb7dc6d701e1a6c4087449a8' '92818e7a8e120d271e90ec194b397edb')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # apply patch...
  patch -Np1 -i ${startdir}/${pkgname}-tpafix.diff || return 1

  # Generating build system
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
