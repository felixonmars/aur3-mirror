# Maintainer: Julian Brost <julian.brost@googlemail.com>
pkgname=munin-libvirt-plugins
pkgver=0.0.6
pkgrel=1
pkgdesc="Libvirt Munin Plugins"
arch=('any')
url="http://honk.sigxcpu.org/projects/libvirt/#munin"
license=('GPL')
groups=()
depends=('libvirt' 'munin-node' 'python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://honk.sigxcpu.org/projects/libvirt/monitor/releases/$pkgname-$pkgver.tar.gz"
        "munin-libvirt.conf")
noextract=()
md5sums=('0d777de264f4519b19c4ddd28a13bec9'
         'a2e2cf6f20a787c5c75cb318150fcc4a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' libvirt-* munin-libvirt-plugins-detect.in
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PLUGINDIR="/usr/lib/munin/plugins" install
  install -D -m 644 "$srcdir/munin-libvirt.conf" "$pkgdir/etc/munin/plugin-conf.d/libvirt.conf"
}

# vim:set ts=2 sw=2 et:
