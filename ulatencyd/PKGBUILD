# Maintainer: avrilpark <avrilrosepark@gmail.com>

pkgname=ulatencyd
pkgver=0.5.0
pkgrel=8
pkgdesc="Daemon to minimize latency on a linux system using cgroups."
arch=(i686 x86_64)
url="https://github.com/poelzi/ulatencyd"
license=('GPL3')
depends=('lua51-posix' 'lua' 'dbus-glib' 'libxcb' 'polkit')
optdepends=('python2-qt: qt gui'
            'systemd: systemd service')
makedepends=('cmake')
conflicts=("$pkgname-git")
backup=("etc/$pkgname/$pkgname.conf")
options=('!emptydirs')
source=("https://github.com/AvrilPark/downloads/raw/master/$pkgname-$pkgver.tar.gz"
        "$pkgname.d" "$pkgname" "std.patch")
md5sums=('d9e95333b5bab0f1bc03587bdd59e142'
         'ceb27033cb79d2a9ad71e390b0b75d7d'
         '2fb2440ceab34523d6207dfc53dc79d5'
         '6c3356fb18bd53dcb05987eb1a111d65')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # man path fix
  sed -i "s|/man/man|/share&|g" docs/CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DSYSTEMD_DIR="/usr/lib/systemd/system"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # daemon
  install -Dm755 ../$pkgname "$pkgdir/etc/rc.d/$pkgname"
  install -Dm644 ../$pkgname.d "$pkgdir/etc/conf.d/$pkgname"

  # pyqt gui python2 fix
  sed -i 's/env python/&2/' "$pkgdir/usr/bin/ulatency"
}

# vim:set ts=2 sw=2 et:
