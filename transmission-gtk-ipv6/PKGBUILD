# Contributor: osily <ly50247(at)gmail.com>

pkgname=('transmission-gtk-ipv6')
pkgbase=('transmission')
pkgver=2.13
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
provides=('transmission-gtk')
conflicts=('transmission-gtk')
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI),with ipv6 support"
depends=('curl' 'libevent' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'curl' 'libnotify' 'desktop-file-utils' 'libevent')
optdepends=('notification-daemon: Desktop notification support'
  	      'transmission-cli: daemon and web support')
source=(http://mirrors.m0k.org/transmission/files/${pkgbase}-${pkgver}.tar.bz2)
md5sums=('eb126ae88b80487f2840896939019421')
build() {
  install=transmission-gtk-ipv6.install
  cd "${srcdir}/${pkgbase}-${pkgver}"

  cat libtransmission/web.c | sed /"if(( addr = tr_sessionGetPublicAddress( s, TR_AF_INET )))"/d \
  | sed /"curl_easy_setopt( e, CURLOPT_INTERFACE, tr_ntop_non_ts( addr ) );"/d > libtransmission/web.c.0
  mv libtransmission/web.c.0 libtransmission/web.c

  ./configure --prefix=/usr --disable-cli --disable-daemon
  make
  make -C gtk install DESTDIR="${pkgdir}" || return 1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/transmission-gtk/COPYING"
}

