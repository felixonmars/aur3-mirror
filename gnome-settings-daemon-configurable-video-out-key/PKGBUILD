# Maintainer: Tener  <gtener@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=gnome-settings-daemon
pkgname=gnome-settings-daemon-configurable-video-out-key
pkgver=3.2.0
pkgrel=2
pkgdesc="The GNOME Settings daemon, with configurable video-out key (default is Super-P)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgnomekbd' 'gnome-desktop' 'libnotify' 'hicolor-icon-theme' 'libcanberra-pulse' 'gsettings-desktop-schemas' 'nss' 'gconf' 'dconf' 'pulseaudio' 'pulseaudio-alsa' 'upower')
makedepends=('intltool' 'gtk-doc' 'gnome-desktop')
options=('!emptydirs' '!libtool')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
provides=(gnome-settings-daemon)
conflicts=(gnome-settings-daemon)
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/${pkgver%.*}/${_pkgbasename}-${pkgver}.tar.xz
fix_color_crash.patch
hardcoded_super_p.patch)
sha256sums=('a85242ce60b9c9bb3fbad124ee06430a408f39fa31d2d4ea29dc179db724447b'
            'b249d21702d4cf9a3a8dc177ba17c00d33e8e742e548811552d79ddeff1e91e3'
            '8c63d67d715997543506d10db23de18e7d8a665f926603af8feff3c1043be744')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  patch -Np1 -i "$srcdir/fix_color_crash.patch"
  #http://bugzilla-attachments.gnome.org/attachment.cgi?id=184767
  patch -Np1 -i "$srcdir/hardcoded_super_p.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-settings-daemon --disable-static --enable-pulse \
      --with-pnpids=/usr/share/libgnome-desktop-3.0/pnp.ids
  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
