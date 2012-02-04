# Contributor: Benjamin Andresen <benny AT klapmuetz DOT org>
pkgname=mosref
pkgver=2.0beta3
_realver=2.0-beta3
pkgrel=2
pkgdesc="Mosquito is a secure remote execution framework"
url="http://www.ephemeralsecurity.com/mosref/"
makedepends=('guile')
source=(http://dl.sourceforge.net/sourceforge/mosref/mosref-$_realver.tar.gz fix_paths.patch)
md5sums=('a8e1d9a2778c4e7e1e0b1dc408bcd2e1' 'a664c961608464d7a41aaca7f30c1c86')
options=('nostrip')

build() {
  cd $startdir/src/mosref-$_realver

  patch -p0 -i ../fix_paths.patch

  USE_GUILE="y" make || return 1
  make package || return 1

  for dir in bin core lib mosref mosref/cmd mosref/prop site stubs test; do
    install -dm755 $startdir/pkg/opt/mosref/$dir
    install -m644 mosref-*/$dir/* $startdir/pkg/opt/mosref/$dir
  done
  chmod 755 $startdir/pkg/opt/mosref/bin/{mosref,mosvm}

  # Don't clutter the path by useless binaries ;-)
  install -dm755 $startdir/pkg/usr/bin
  for bin in mosref mosvm; do
    ln -sf /opt/mosref/bin/$bin $startdir/pkg/usr/bin/$bin
  done
}
# vim: set ft=sh ts=2 et:
