# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-session-3-8
_realpkg=gnome-session
pkgver=3.8.2
pkgrel=1
pkgdesc="The GNOME Session Handler version 3.8.x"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=(systemd dconf gconf gsettings-desktop-schemas gtk3 gnome-desktop
         hicolor-icon-theme json-glib libgl libsm libxtst upower)
makedepends=(intltool mesa gtk-doc xtrans)
options=('!emptydirs')
conflicts=('gnome-session')
provides=('gnome-session' "gnome-session=$pkgver")
install=gnome-session.install
url="http://www.gnome.org"
groups=(gnome)
source=(http://download.gnome.org/sources/$_realpkg/${pkgver::3}/$_realpkg-$pkgver.tar.xz
        timeout.patch)
sha256sums=('a6ed1c109005f81ec34a8aa09b2f114c07b4fba8feef47d2f23559797be88640'
            '9eaf31857b41db417475c3b14adc11b10c8226ed76978cdf96dd648fa6e505fc')

build() {
  cd $_realpkg-$pkgver

  # Increase timeout, for slow machines
  patch -Np1 -i ../timeout.patch

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/gnome-session \
      --disable-schemas-compile --enable-systemd
  make
}

package() {
  cd $_realpkg-$pkgver
  make DESTDIR="$pkgdir" install
}
