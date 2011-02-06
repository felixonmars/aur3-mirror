# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
pkgname=supergameboy
pkgver=0.015
pkgrel=1
pkgdesc="bsnes library for Super Game Boy support."
arch=('i686' 'x86_64')
url="http://byuu.org/bsnes/"
license=('GPL2')
depends=('gcc-libs')
makedepends=('pkgconfig')
source=("http://byuu.org/files/${pkgname}_v015.tar.bz2")
md5sums=('77758d388360d48e8619a6fb7c8a54ea')

build() {
  cd "${srcdir}/${pkgname}"

  # Conform to the Arch Linux packaging standards
  sed -e 's|\(libsupergameboy.*\) $(DESTDIR)$(prefix)/lib|\1 $(DESTDIR)$(prefix)/lib/\1|' \
      -i "${srcdir}/${pkgname}/Makefile" || return 1

  # Build and install it
  make || return 1
  make install DESTDIR=$pkgdir prefix=/usr || return 1
  chmod 644 "${pkgdir}/usr/lib/lib${pkgname}.a" || return 1
}