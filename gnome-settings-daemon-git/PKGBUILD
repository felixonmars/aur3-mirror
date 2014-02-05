# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-settings-daemon
pkgname=$_pkgname-git
pkgver=3.11.5
pkgrel=1
_realver=3.11.5
pkgdesc="The GNOME Settings daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=("colord" 'dconf' "gnome-desktop>=3.11.1" "gsettings-desktop-schemas" 'hicolor-icon-theme' 'libcanberra-pulse' 'libnotify'
         'libsystemd' 'libwacom' 'pulseaudio' 'pulseaudio-alsa' "upower>=0.99.0" 'librsvg' "geoclue2>=2.1.0" "geocode-glib")
makedepends=('intltool' 'xf86-input-wacom' 'libxslt' 'docbook-xsl')
options=('!emptydirs' '!libtool')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
conflicts=('gnome-settings-daemon')
replaces=('gnome-settings-daemon')
provides=('gnome-settings-daemon' "gnome-settings-daemon=$_realver")
source=('git://git.gnome.org/gnome-settings-daemon')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gnome-settings-daemon"
  git describe --always | sed -E 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  cd "$srcdir/gnome-settings-daemon"

  CC=/usr/bin/gcc ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-settings-daemon --disable-static

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$srcdir/gnome-settings-daemon"
  make DESTDIR="$pkgdir" install
}
