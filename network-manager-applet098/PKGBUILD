# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>

_name=network-manager-applet
pkgname=network-manager-applet098
pkgver=0.9.8.10
pkgrel=1
pkgdesc="Applet for managing network connections (0.9.8.x series)"
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org/projects/NetworkManager/"
depends=(networkmanager098 libsecret gtk3 libnotify
         gnome-icon-theme mobile-broadband-provider-info iso-codes)
makedepends=(intltool gobject-introspection modemmanager python2)
provides=("${_name}=${pkgver}")
conflicts=("${_name}" 'libnm-gtk')
options=('!emptydirs')
install=network-manager-applet.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$_name/0.9/$_name-$pkgver.tar.xz)
sha256sums=('46fee9a1e667d1826e6a94bb6bd2e6bdbde535fc995e534542f5f7e8b8dae0cb')

build() {
  cd ${_name}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static \
      --disable-more-warnings \
      --disable-maintainer-mode \
      --disable-migration \
      --with-modem-manager-1

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd ${_name}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
