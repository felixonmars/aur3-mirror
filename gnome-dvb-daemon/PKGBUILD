# Maintainer: Steven Vanden Branden<stevenvandenbrandenstift at gmail dot com>
# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=gnome-dvb-daemon
pkgver=0.2.90
pkgrel=1
pkgdesc="A daemon to setup DVB devices, record and watch TV shows and browse EPG"
arch=('i686' 'x86_64')
url="http://live.gnome.org/DVBDaemon"
license=('GPL3')
depends=('gst-plugins-bad' 'gst-rtsp-server'
         'hicolor-icon-theme' 'python'
         'sqlite')
makedepends=('pkg-config' 'gnome-common' 'vala' 'intltool')
options=(!libtool)
install=${pkgname}.install
source=(http://ftp.gnome.org/pub/GNOME/sources/gnome-dvb-daemon/0.2/${pkgname}-${pkgver}.tar.xz)
sha256sums=('8d1f3cc6cd8cdb5e032841ea136d27c432f2c8a9b9e46fc8e7d752e22c875a5f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --exec_prefix=/usr
  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
  	install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
}
