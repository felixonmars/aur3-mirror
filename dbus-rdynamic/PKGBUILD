# Contributor: Finn O'leary <finnoleary@inventati.org>

pkgbase=dbus-rdynamic
pkgname=('dbus-rdynamic')
pkgver=1.8.12
pkgrel=1
pkgdesc="Freedesktop.org message bus system, compiled with -rdynamic support"
url="http://www.freedesktop.org/Software/dbus"
arch=(i686 x86_64)
license=('GPL' 'custom')

provides=('dbus' 'libdbus')
conflicts=('dbus' 'libdbus')
replaces=('dbus' 'libdbus')

makedepends=('expat' 'glibc' 'libx11' 'systemd' 'xmlto' 'docbook-xsl')
optdepends=('libx11: dbus-launch support')

source=(http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz{,.asc}
        30-dbus)
md5sums=('0ca23fc84c09cb3d29b9c27811ff4475'
         'SKIP'
         '3314d727fa57fc443fce25b5cbeebbcc')

build() {
  cd dbus-$pkgver
  CFLAGS="-rdynamic" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=dbus \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify --disable-dnotify \
      --disable-verbose-mode --disable-static \
      --disable-tests --disable-asserts \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-systemd
  make
}

package(){
  cd dbus-$pkgver

  make DESTDIR="$pkgdir" -C dbus install
  make DESTDIR="$pkgdir" install-data-am
  # Disable installation of libdbus
  sed -i -e 's/^SUBDIRS = dbus/SUBDIRS =/' Makefile

  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}/var/run"
  rm -rf "${pkgdir}/usr/lib/pkgconfig"

  install -Dm755 ../30-dbus "$pkgdir/etc/X11/xinit/xinitrc.d/30-dbus"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/dbus/COPYING"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/libdbus/COPYING"
}
