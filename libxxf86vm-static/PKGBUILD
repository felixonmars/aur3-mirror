# Contributor: Piotr Sobiech <sobiech at wredny dot net>
pkgname=libxxf86vm-static
_pkgname=libXxf86vm
pkgver=1.1.0
pkgrel=2
pkgdesc="X11 XFree86 video mode extension library. This package also includes the static lib, which is excluded from the official package, and is neaded to build LJWGL."
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
conflicts=('libxxf86vm')
depends=('libxext>=1.1' 'xf86vidmodeproto>=2.3')
makedepends=('pkgconfig')
options=('!libtool')
#replaces=('libxxf86vm')
provides=('libxxf86vm=1.1.0')
source=("http://xorg.freedesktop.org/archive/individual/lib/libXxf86vm-${pkgver}.tar.bz2")
md5sums=('b431ad7084e1055fef99a9115237edd8')

build() { 
  cd "${srcdir}/${_pkgname}-${pkgver}"
# It should build static's by default, but don't let them have a choice :)
  ./configure --prefix=/usr --enable-static --enable-shared || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}

# vim:set ts=2 sw=2 et:
