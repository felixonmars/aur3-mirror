# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=transmission-beta-gtk
pkgbase=transmission
pkgver=2.30b3
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')

depends=('curl' 'libevent' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme' 'gtk2' 'dbus-glib')

makedepends=('intltool' 'curl' 'desktop-file-utils' 'libevent' 'dbus-glib')

provides=('transmission-gtk')
conflicts=('transmission-gtk')

install=transmission-beta-gtk.install

source=(http://download.transmissionbt.com/files/${pkgbase}-${pkgver}.tar.xz)
md5sums=('ba8db43d10f981eecf1c0790cd17e273')

build()
{
  cd "${srcdir}/${pkgbase}-${pkgver}"
  
  ./configure --prefix=/usr --disable-cli --disable-daemon
  
  make
  
  make -C gtk DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/transmission-gtk/COPYING"
}
