# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-session
pkgname=$_pkgname-git
pkgver=3.14.0.1.gb49225e
pkgrel=1
pkgdesc="The GNOME Session Handler"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=("glib2>=2.39.1" 'systemd' 'dconf' 'gsettings-desktop-schemas' 'gconf' 'gtk3' 'gnome-desktop'
         'hicolor-icon-theme' 'json-glib' 'libgl' 'libsm' 'libxtst' 'upower')
makedepends=('git' 'intltool' 'mesa' 'xtrans' 'gnome-common')
options=('!emptydirs')
install=gnome-session.install
url="http://www.gnome.org"
groups=(gnome)
conflicts=('gnome-session')
replaces=('gnome-session')
provides=('gnome-session=3.14.0')
source=('git://git.gnome.org/gnome-session'
        'timeout.patch')
sha256sums=('SKIP'
            '9eaf31857b41db417475c3b14adc11b10c8226ed76978cdf96dd648fa6e505fc')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Increase timeout, for slow machines
  patch -Np1 -i ../timeout.patch
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/gnome-session \
      --disable-schemas-compile --enable-systemd --enable-man=no
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
