# Contributor: grimi <grimi at poczta dot fm>

pkgname=lib32-ubuntulooks
_pkgname32=ubuntulooks
pkgver=0.9.12
pkgrel=1
_pkgrel=2
pkgdesc="GTK2 Ubuntu theme engines"
arch=('x86_64')
url="http://packages.ubuntu.com/hardy-updates/gtk2-engines-ubuntulooks"
license=('GPL2')
depends=('lib32-gtk2')
source=("ftp://ftp.mirrorservice.org/sites/ftp.archlinux.org/extra/os/i686/$_pkgname32-$pkgver-$_pkgrel-i686.pkg.tar.gz")
md5sums=('ee3b9bbda59163d766ac86b7eb880cb4')

build() {
  mkdir -p $startdir/pkg/opt/lib32/usr/lib/gtk-2.0/2.10.0/engines
  mkdir -p $startdir/pkg/opt/lib32/usr/share/gtk-engines
  cp -rPfp $startdir/src/usr $startdir/pkg/opt/lib32
}
