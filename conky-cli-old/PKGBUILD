# Contributor: JokerBoy <jokerboy at punctweb dot ro>

pkgname=conky-cli-old
_pkgname=conky
pkgver=1.8.0
pkgrel=1
pkgdesc='Conky command line, without X11 dependencies (old version)'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net'
license=('custom')
depends=('alsa-lib' 'ncurses')
provides=('conky')
conflicts=('conky')
options=(!emptydirs)
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3fcc5bc005c6c046587134cdb9fdadfa')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --disable-lua \
      --disable-x11 \
      --disable-double-buffer \
      --disable-xdamage \
      --disable-own-window \
      --disable-xft \
      --disable-hddtemp \
      --disable-portmon
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/etc/conky/conky_no_x11.conf" "${pkgdir}/etc/conky/conky.conf"
  install -D -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
