# Maintainer : cantabile <cantabile dot desu at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_appname=transmission
_suffix=-beta
pkgname=${_appname}${_suffix}
pkgver=2.30b4
pkgrel=1
arch=('i686' 'x86_64')

url="http://www.transmissionbt.com/"
license=('MIT')
pkgdesc="Fast, easy, and free BitTorrent client (daemon, cli, gtk, qt, web clients included)"

depends=('curl' 'libevent' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme' 'gtk2' 'dbus-glib' 'libcanberra' 'qt')
makedepends=('intltool')
optdepends=('notification-daemon: Desktop notification support')

conflicts=('transmission-cli' 'transmission-gtk' 'transmission-qt')
provides=('transmission-cli' 'transmission-gtk' 'transmission-qt')

backup=('etc/conf.d/transmissiond')

install='transmission-beta.install'

source=("http://mirrors.m0k.org/transmission/files/${_appname}-${pkgver}.tar.xz"
        "transmissiond"
        "transmissiond.conf")

build() {
  cd "${srcdir}/${_appname}-${pkgver}"

  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  ./configure --prefix=/usr --disable-gconf2
  make
  pushd qt
  qmake qtr.pro
  make
}

package() {
  cd "${srcdir}/${_appname}-${pkgver}"

  for dir in daemon cli web utils gtk po
  do
      make -C "${dir}" DESTDIR="${pkgdir}" install
  done

  make -C qt INSTALL_ROOT="${pkgdir}"/usr install

  install -D -m755 "${srcdir}/transmissiond" "${pkgdir}/etc/rc.d/transmissiond"
  install -D -m644 "${srcdir}/transmissiond.conf" "${pkgdir}/etc/conf.d/transmissiond"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/transmission-beta/COPYING"
  install -D -m644 qt/icons/transmission.png "${pkgdir}/usr/share/pixmaps/transmission-qt.png"
  install -D -m644 qt/transmission-qt.desktop "${pkgdir}/usr/share/applications/transmission-qt.desktop"
}
md5sums=('fa4e4c68adaabfe016d2358428c25da2'
         '50b7c17300bc8b38f44fb6f681ba05d0'
         'be39806c35b7544856fa4070b00fc960')
