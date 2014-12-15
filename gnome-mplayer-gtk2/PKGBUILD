pkgname=gnome-mplayer-gtk2
pkgver=1.0.9
pkgrel=1
pkgdesc='A simple MPlayer GUI. GTK2 version.'
arch=('i686' 'x86_64')
url='http://gnome-mplayer.googlecode.com/'
license=('GPL')
depends=('mplayer' 'dbus-glib' 'libnotify' 'hicolor-icon-theme' 'dconf' 'gmtk-gtk2')
makedepends=('gnome-power-manager')
provides=(gnome-mplayer=${pkgver})
conflicts=('gnome-mplayer')
install="${pkgname}.install"
source=("https://gnome-mplayer.googlecode.com/svn/packages/gnome-mplayer-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/gnome-mplayer-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-nautilus --disable-gtk3
  make
}

package() {
  cd "${srcdir}/gnome-mplayer-${pkgver}"

  make DESTDIR="${pkgdir}" install

  sed -i 's@Exec=gnome-mplayer %U@Exec=gnome-mplayer %F@' \
    "${pkgdir}/usr/share/applications/gnome-mplayer.desktop"
}

md5sums=('26c3ab335b6fcdda220b05c977f5b0f1')
