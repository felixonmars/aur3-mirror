# $Id: PKGBUILD 13455 2008-09-27 11:03:58Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcanberra-oss
_realname=libcanberra
pkgver=0.25
pkgrel=1
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification"
url=http://0pointer.de/lennart/projects/libcanberra
arch=(i686 x86_64)
license=('LGPL')
depends=('libvorbis' 'gtk2>=2.21.8' 'tdb>=1.2.1')
makedepends=('gtk-doc' 'gstreamer0.10>=0.10.30' 'libtool')
provides=('libcanberra' "libcanberra=$pkgver")
conflicts=('libcanberra')
install=libcanberra.install
options=(!libtool)
source=(http://0pointer.de/lennart/projects/${_realname}/${_realname}-${pkgver}.tar.gz
	libcanberra-gtk-module.sh)
md5sums=('23de3d11abd4920c6c9560e3a566e04d'
         'a54799e624aac814b9343ab05f25c38b')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var --disable-static --enable-oss --disable-alsa --with-builtin=dso || return 1
  make || return 1
  make -j1 DESTDIR="${pkgdir}" install || return 1
  rm -f ${pkgdir}/usr/lib/*.la
  rm -f ${pkgdir}/usr/lib/gtk-2.0/modules/*.la
  
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas" 
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/libcanberra.schemas \
                     ${pkgdir}/etc/gconf/schemas/*.schemas
                     
  rm -r $pkgdir/etc
  install -m755 -d "${pkgdir}/etc/X11/xinit/xinitrc.d"
  install -m755 "${srcdir}/libcanberra-gtk-module.sh" "${pkgdir}/etc/X11/xinit/xinitrc.d/40-libcanberra-gtk-module" || return 1
}
