# Maintainer: Yichao Yu (yuyichao) <yyc1992 AT gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=gnome-settings-daemon
pkgname=gnome-settings-daemon-noibus
pkgver=3.6.4
pkgrel=1
pkgdesc="The GNOME Settings daemon, (compiled without ibus integration, so any input method framework can be used with it.)"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
  'dconf' 'gnome-desktop' 'gsettings-desktop-schemas' 'hicolor-icon-theme'
  'libcanberra-pulse' 'libnotify' 'libsystemd' 'libwacom' 'nss' 'pulseaudio'
  'pulseaudio-alsa' 'upower')
makedepends=('intltool' 'xf86-input-wacom' 'libxslt' 'docbook-xsl')
provides=("${pkgbase}=${pkgver}")
conflicts=("${pkgbase}")
options=('!emptydirs' '!libtool')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgbase/${pkgver%.*}/$pkgbase-$pkgver.tar.xz"
  0001-power-and-media-keys-Use-logind-for-suspending-and-r.patch)
sha256sums=('3db993f2dbabc0c9d06a309bb12c9a7104b9cdda414ac4b1c301f5114a441c15'
            '5572b5b3f554ce361353a8db42c26a8f789606f65acc5943a286271603fcb8eb')

build() {
  cd $pkgbase-$pkgver

  # logind key handling FS#31801, patch from Fedora
  # rebased onto screensaver.patch
  patch -Np1 -i ../0001-power-and-media-keys-Use-logind-for-suspending-and-r.patch
  aclocal
  autoconf
  automake --add-missing

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-settings-daemon --disable-static \
      --enable-systemd --disable-ibus

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  # Plugins that aren't installed still have schema references
  # and cause gsettings errors - remove the references we're not using
  sed -i '/org\.gnome\.settings-daemon\.plugins\.updates/d' \
    "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.gschema.xml"
}
