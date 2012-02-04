# $Id: PKGBUILD 20566 2008-12-05 20:40:20Z jgc $
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Originally by z4ziggy for Archie

pkgname=unionfs-utils
pkgver=200611041820
pkgrel=1
pkgdesc="A stackable unification file system, which can merge the contents of several directories"
arch=('i686' 'x86_64')
url="http://www.unionfs.org/"
license=('GPL2')
depends=(e2fsprogs)
makedepends=(autoconf automake libtool gcc)
options=('!libtool')
source=(ftp://ftp.filesystems.org/pub/unionfs/unionfs-utils-0.x/snapshots/unionfs-utils-0.1-cvs${pkgver}.tar.gz)
md5sums=('9a0e61a38c176386feb86d0b2c157afb')

build() {
  cd "${srcdir}/unionfs-utils-0.1-cvs${pkgver}"
  ./bootstrap && ./configure --prefix=/usr || return 1
  make || return
  make DESTDIR="${pkgdir}" install || return 1
}
