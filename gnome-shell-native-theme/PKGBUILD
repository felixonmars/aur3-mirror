# Maintainer: NanoArch <nanoarch77@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-native-theme
_pkgname=gnome-shell
pkgver=3.12.1
pkgrel=1
pkgdesc="The next generation GNOME Shell with the support of themes without extensions"
arch=(i686 x86_64)
url="http://live.gnome.org/GnomeShell"
license=(GPL2)
depends=(accountsservice caribou gcr gjs gnome-bluetooth gnome-menus upower
         gnome-session gnome-settings-daemon gnome-themes-standard gsettings-desktop-schemas
         libcanberra-pulse libcroco libgdm libsecret mutter mutter-wayland network-manager-applet
         telepathy-logger telepathy-mission-control unzip gstreamer)
makedepends=(intltool gtk-doc gnome-control-center evolution-data-server)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
install=gnome-shell.install
groups=(gnome)
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        nm-libexecdir.patch
	gnome-shell-native-theme.patch)
conflicts=($_pkgname)
provides=($_pkgname=$pkgver)
sha256sums=('d5a475f390d992de03ccf8ffeafec90595da700594eba9fc0688cbb1652b5516'
            'e5bb10ad2e5c3e0fde3d05babd1bfdda701e553e02d493f7e54cb7832ce7e607'
            '18faba56366c457f5c345807813f81556ff9a24f2593eafba674679e820ece9b')

prepare() {
  cd $_pkgname-$pkgver

  # Native theme patch
  patch -Np1 -i ../gnome-shell-native-theme.patch

  # FS#30747 FS#32730 Problems due to libexecdir different from NM
  patch -Np1 -i ../nm-libexecdir.patch
}

build() {
  cd $_pkgname-$pkgver
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/gnome-shell \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Must exist; FS#37412
  mkdir -p "$pkgdir/usr/share/gnome-shell/modes"
}
