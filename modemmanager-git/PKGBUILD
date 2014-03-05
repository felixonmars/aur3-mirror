# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>
# Old Maintainer: <grinko@gmx.at>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=modemmanager-git
_pkgname=modemmanager
_realname=ModemManager
pkgver=1.2.0.95.gf3ded99
pkgrel=1
epoch=1
pkgdesc="Mobile broadband modem management service (development version)"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/ModemManager/ModemManager/"
license=('GPL2')
depends=('udev' 'ppp' 'libqmi' 'libmbim' 'polkit' 'hicolor-icon-theme')
makedepends=('intltool' 'git' 'gtk-doc')
optdepends=('usb_modeswitch: install if your modem shows up as a storage drive')
options=('!libtool')
install=modemmanager.install
conflicts=('modemmanager')
provides=('modemmanager' 'libmm-glib')
source=("$_pkgname::git://anongit.freedesktop.org/$_realname/$_realname")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"

  # NOTE: The ModemManager maintainers seem to use "lightweight" tags
  #       rather than annotated tags, so we'll pass '--tags' to 'git'
  local ver="$(git describe --tags)"
  printf "%s" "${ver//-/.}"
}


build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --with-udev-base-dir=/usr/lib/udev \
              --disable-static \
              --with-polkit=permissive
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
