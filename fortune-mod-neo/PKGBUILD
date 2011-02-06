# Contributer: Ricardo Ferreira <ricardo(at)dazzledminds(dot)net>
pkgname=fortune-mod-neo
pkgver=1
pkgrel=1
pkgdesc="#Neo's fortune cookie file"
url="http://www.formatdei.com"
license="custom"
depends=('fortune-mod')
groups=('fortune-mods')
source=('neo')
arch=('i686')
md5sums=('06b460e7d859612b49c83afff13b4702')

build() {
  cd $startdir/src

  strfile neo neo.dat

  install -D -m644 neo $startdir/pkg/usr/share/fortune/neo
  install -D -m644 neo.dat $startdir/pkg/usr/share/fortune/neo.dat
}
# vim: set ft=sh ts=2 et:
