# Maintainer: Trent McPheron (twilightinzero at gmail dot com)
# based on pkgbuild by Jan de Groot (jgc at archlinux dot org)

pkgname=vte-text-shadows
_pkgname=vte
pkgver=0.24.3
pkgrel=1
pkgdesc="Virtual Terminal Emulator library patched to use black text shadows."
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtk2>=2.20.1')
options=('!libtool')
makedepends=('pygtk>=2.17.0' 'pkg-config' 'intltool')
provides=('vte')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/0.24/${_pkgname}-${pkgver}.tar.bz2
        vte-text-shadows.patch)
sha256sums=('fe7d01178976b17ca809e41d0e6dbbcb28e2af5e2f5aa857f9df65affac17d01'
            'e84d636b025f73f22ce71822b45fb754bece5e82341bfe98707bd6890f5c4f85')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/vte-text-shadows.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static
  make
  make DESTDIR="${pkgdir}" install
}
