# Maintainer: Paolo Stivanin <garrett16@hotmail.it>

pkgname=conky-new
_pkgname=conky
pkgver=1.8.0_rc2
pkgrel=3
pkgdesc="Conky is an advanced, highly configurable system monitor for X based on torsmo"
arch=('i686' 'x86_64')
url="http://conky.sourceforge.net/"
license=('custom')
replaces=('torsmo')
provides=('conky=1.8.0._rc2')
depends=('automake>=1.11' 'alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2')
makedepends=('pkgconfig')
backup=(etc/conky/conky.conf etc/conky/conky_no_x11.conf)
source=(http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-development/$pkgver/${_pkgname}-$pkgver.tar.gz)
md5sums=('7f550e26900b2e0a5d4efb38b3de8fc6')
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-wlan \
              --enable-rss \
              --enable-ibm \
              --enable-imlib2 \
              --disable-lua
  make || return 1
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
