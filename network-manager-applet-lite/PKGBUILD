# Maintainer: Westminboy <westminboy@gmail.com>

pkgname=network-manager-applet-lite
_pkgname=network-manager-applet
pkgver=0.9.6.4
pkgrel=1
pkgdesc="GNOME frontend to NetWorkmanager fot gtk2, totally get rid of gtk3 "
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'gtk2' 'libnotify' 'hicolor-icon-theme' 'libgnome-keyring' 'dbus-glib')
makedepends=('intltool')
optdepends=('gnome-bluetooth: for PAN/DUN support')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
install=network-manager-applet.install
source=("http://ftp.gnome.org/pub/GNOME/sources/network-manager-applet/0.9/network-manager-applet-${pkgver}.tar.xz")
sha256sums=('ae5667b165f0f83244ec76c42f17553ec2169f5250e144904994497137374141')


build() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/GtkBox/GtkVBox/g' src/connection-editor/nm-connection-editor.ui
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --with-gtkver=2 \
      --disable-maintainer-mode \
      --disable-static \
      --disable-iso-codes \
      --disable-migration \
      --disable-more-warnings
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
