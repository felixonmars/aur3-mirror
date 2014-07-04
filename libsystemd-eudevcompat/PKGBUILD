# Maintainer: artoo <flower_of_life@gmx.net>
# Contributor: Philip Müller <philm|manjaro|org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=libsystemd-eudevcompat
pkgver=214
pkgrel=2
pkgdesc="systemd client libraries without udev"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.freedesktop.org/wiki/Software/systemd"
provides=("libsystemd=${pkgver}"
		'libsystemd.so' 'libsystemd-daemon.so' 'libsystemd-id128.so'
		'libsystemd-journal.so' 'libsystemd-login.so')
depends=('glib2' 'glibc' 'libgcrypt' 'xz')
optdepends=('eudev-openrc: eudev initscript')
conflicts=('libsystemd')

if [ "$CARCH" = "i686" ]; then
   source=("ftp://ftp.archlinux.org/pool/packages/libsystemd-$pkgver-$pkgrel-$CARCH.pkg.tar.xz")
   sha256sums=('c9a49961d499c1282e70c0e828bd77397f3b5d8ecbdedb8064fa56af294e9622')
elif [ "$CARCH" = "x86_64" ]; then
   source=("ftp://ftp.archlinux.org/pool/packages/libsystemd-$pkgver-$pkgrel-$CARCH.pkg.tar.xz")
   sha256sums=('3b81492edc14fff77fc256bb3f95eed13c7e2e568eb1305cff4f67744628c0af')
fi

prepare() {
  rm usr/lib/lib{g,}udev*.so*
}

package() {
  mv "$srcdir/usr/" "$pkgdir"
}
