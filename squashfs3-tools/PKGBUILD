# Maintainer: Christos Nouskas <nous at archlinux dot us>

pkgname=squashfs3-tools
_pkgname=squashfs-tools
pkgver=3.4
_builddir=squashfs${pkgver}/${_pkgname}
pkgrel=2
pkgdesc="Tools for squashfs, a highly compressed read-only filesystem for Linux. Version 3."
arch=('i686' 'x86_64')
url="http://www.squashfs.org"
license=('GPL2')
makedepends=('gcc')
source=(squashfs3.4.tar.gz::http://sourceforge.net/projects/squashfs/files/squashfs/squashfs3.4/squashfs3.4.tar.gz/download)



build() {
  cd $srcdir/$_builddir
  make
}

package() {
  cd $srcdir/$_builddir
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/$_builddir/mksquashfs $pkgdir/usr/bin/mksquashfs3
  install -m 0755 $srcdir/$_builddir/unsquashfs $pkgdir/usr/bin/unsquashfs3
}
#
sha256sums=('9ea1a9b3bd4f387ca11b5e96f00f8ae996fb81c4c7ad41f7c7f359917628a339')
