# Contributor: Pierluigi <pierluigi88@gmail.com>

pkgname=ed2k-shutdown
pkgver=0.2
pkgrel=2
pkgdesc="ed2k_shutdown is a little command line utility that cleanly shuts down a running eDonkey2000 or Overnet command line client"
url="http://ed2k-tools.sourceforge.net/ed2k_shutdown.shtml"
license="GPL"
depends=('gnet' 'glib2')
makedepends=('pkgconfig')
conflicts=()
replaces=()
backup=()
install=
source=(http://switch.dl.sourceforge.net/sourceforge/ed2k-tools/ed2k_shutdown-$pkgver.tar.gz)
md5sums=()

build() {
  cd $startdir/src/ed2k_shutdown-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/man/man1
  install -c -D -s ed2k_shutdown $startdir/pkg/usr/bin/ed2k_shutdown
  install -c -m 644 ed2k_shutdown.1 $startdir/pkg/usr/man/man1/ed2k_shutdown.1

}
