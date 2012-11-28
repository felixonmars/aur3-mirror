pkgname=shxd
pkgver=0.4.12
pkgrel=4
pkgdesc="A fork of the Hotline X Daemon (HXD)"
arch=(i686 x86_64)
url="http://synhxd.sourceforge.net"
license=("GPL v2")
install=shxd.install
source=("http://synhxd.sourceforge.net/releases/shxd-$pkgver.tgz"
"shxd.service")
backup=("srv/shxd/hxd.conf"
"srv/shxd/etc/skel/access"
"srv/shxd/etc/AppleVolumes.system"
"srv/shxd/etc/banlist"
"srv/shxd/etc/find.conf"
"srv/shxd/etc/netstat.conf"
"srv/shxd/etc/tracker_banlist")
md5sums=('b244bd58f840eb70509d7f243d8a0c53'
         'dbf847f85da5297e592dcf0fbd5ae2da')

build() {
  cd "${srcdir}/shxd-$pkgver"
  ./configure \
    --prefix=$pkgdir/srv/shxd # makefile ignores DESTDIR
  make
}

package()
{
  cd "${srcdir}/shxd-$pkgver"
  mkdir -p "$pkgdir/srv/shxd" # ... again with the makefile...
  make install
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/srv/shxd/hxd" "$pkgdir/usr/bin/shxd"
  install -Dm644 "$srcdir/shxd.service" "$pkgdir/usr/lib/systemd/system/shxd.service"
  install -Dm644 "README/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}