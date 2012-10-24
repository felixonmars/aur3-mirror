# $Id: PKGBUILD 159086 2012-05-15 13:54:36Z ibiru $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=gnome-settings-daemon
pkgname=gnome-settings-daemon-media-key-fix
pkgver=3.4.2
pkgrel=1
pkgdesc="The GNOME Settings daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=('colord' 'dconf' 'gnome-desktop' 'gsettings-desktop-schemas' 'hicolor-icon-theme' 'libcanberra-pulse' 'libgnomekbd' 'libnotify'
         'libsystemd' 'libwacom' 'nss' 'pulseaudio' 'pulseaudio-alsa' 'upower')
makedepends=('intltool' 'gtk-doc' 'gnome-desktop' 'gnome-common' 'xf86-input-wacom')
options=('!emptydirs' '!libtool')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz
        systemd-fallback.patch
	cups-1.6.patch
	gsd-xinput-2-2-support.patch)
sha256sums=('00499118c80474981f3389ef518e2d001f1b1a3b1fb78e54859d59f3bee38ff4'
            '3af86d4b341d5ca7c94cc814b250b122309d38f48be0bf0581d0c77e763a8008'
	    '9efe540a040016244faedeecc074b404ca5c400c2aa77113986e7432ad6659fb'
	    '1d6e722943447d56a3349a9485b0f975c1cf5aa2d3f10b6153ebbb470349ad51')
provides=(gnome-settings-daemon)
conflicts=(gnome-settings-daemon)

build() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../systemd-fallback.patch
  patch -Np1 -i ../cups-1.6.patch
  patch -Np1 -i ../gsd-xinput-2-2-support.patch

  gnome-autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-settings-daemon --disable-static \
      --enable-systemd

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
