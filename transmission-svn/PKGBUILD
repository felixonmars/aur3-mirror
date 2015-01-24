# $Id: PKGBUILD 216758 2014-07-09 21:49:19Z anatolik $
# Maintainer : Tom Gundersen <teg@jklm.no>
# Maintainer : Ionut Biru <ibiru@archlinux.org>
#
# SVN version : Joshua Ellis <coujellis@gmail.com>

pkgbase='transmission-svn'
pkgname=('transmission-cli-svn' 'transmission-gtk-svn' 'transmission-qt-svn')
pkgver=r14459
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
makedepends=('gtk3' 'intltool' 'curl' 'qt5-base' 'libevent')
source=("${pkgbase}::svn://svn.transmissionbt.com/Transmission/trunk")
md5sums=('SKIP')

pkgver() {
  cd $pkgbase
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"

}

build() {
  cd $pkgbase

  ./autogen.sh --prefix=/usr
  # ./configure --prefix=/usr
  make
  pushd qt
  qmake qtr.pro
  make
}

package_transmission-cli-svn() {
  provides='transmission-cli'
  conflicts='transmission-cli'
  pkgdesc="Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)"
  depends=('curl' 'libevent' 'systemd')
  install=transmission-cli.install

  cd $pkgbase

  for dir in daemon cli web utils
  do
    make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -D -m644 "$srcdir/$pkgbase/daemon/transmission-daemon.service" "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"
}

package_transmission-gtk-svn() {
  provides='transmission-gtk'
  conflicts='transmission-gtk'
  pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI) [svn]"
  depends=('curl' 'libevent' 'gtk3' 'desktop-file-utils' 'hicolor-icon-theme')
  optdepends=('notification-daemon: Desktop notification support'
              'transmission-cli: daemon and web support')
  install=transmission-gtk.install

  cd $pkgbase

  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}

package_transmission-qt-svn() {
  provides='transmission-qt'
  conflicts='transmission-qt'
  pkgdesc="Fast, easy, and free BitTorrent client (Qt GUI) [svn]"
  depends=('curl' 'qt5-base' 'libevent' 'libxkbcommon-x11')
  optdepends=('transmission-cli-svn: daemon and web support')
  install=transmission-qt.install

  cd $pkgbase

  make -C qt INSTALL_ROOT="$pkgdir"/usr install

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
  install -D -m644 qt/icons/transmission.png "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -D -m644 qt/transmission-qt.desktop "$pkgdir/usr/share/applications/transmission-qt.desktop"
}

# vim: sw=2

