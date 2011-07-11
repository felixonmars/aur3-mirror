pkgname=bamf-daemon
pkgver=0.2.92
pkgrel=3
pkgdesc="Removes the headache of applications matching into a simple DBus daemon and c wrapper library"
arch=('i686' 'x86_64')
url="https://launchpad.net/bamf"
license=('GPL')
depends=('glib2' 'dbus-glib' 'libwnck3' 'libgtop')
options=(!libtool)
source=(http://archive.ubuntu.com/ubuntu/pool/main/b/bamf/bamf_$pkgver.orig.tar.gz)
md5sums=('f2d557fa009c1a73c6dca8a84150bc92')
conflicts=('bamf')
groups=('unity2d-bzr')

build() {
  cd "$srcdir/bamf-$pkgver"
  export CFLAGS="$CFLAGS -Wno-error=unused-but-set-variable"
  export CXXFLAGS="${CFLAGS}"
  export LDFLAGS="-Wl,-z,defs -Wl,--as-needed"
  rm -rf "$srcdir/bamf-$pkgver/bin"
  ./configure --prefix=/usr --enable-introspection=no
  make
}
package() {
  cd "$srcdir/bamf-$pkgver"
  mkdir bin
  make DESTDIR="$srcdir/bamf-$pkgver/bin" install
  install -D -m755 $srcdir/bamf-$pkgver/bin/usr/libexec/bamfdaemon ${pkgdir}/usr/libexec/bamfdaemon
  install -D -m644 $srcdir/bamf-$pkgver/bin/usr/lib/gio/modules/libgiobamf.so ${pkgdir}/usr/lib/gio/modules/libgiobamf.so
  install -D -m644 $srcdir/bamf-$pkgver/bin/usr/share/dbus-1/services/org.ayatana.bamf.service ${pkgdir}/usr/share/dbus-1/services/org.ayatana.bamf.service
}
