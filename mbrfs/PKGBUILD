# Maintainer: FrozenCow <frozencow@gmail.com>
pkgname=mbrfs
pkgver=0.5.0
pkgrel=1
pkgdesc="FUSE filesystem that allows access to partitions of block and image files."
url="https://github.com/FrozenCow/mbrfs"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('fuse')
source=("${pkgname}-${pkgver}::git+https://github.com/FrozenCow/mbrfs.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir}/usr install
}

# vim:set ts=2 sw=2 et: