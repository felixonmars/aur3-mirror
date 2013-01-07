# Maintainer: Drake Arconis <lightdrake at gmail dot com>
# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=ndofdev
pkgver=0.3
pkgrel=1
pkgdesc="Space navigator joystick library development files"
arch=('i686' 'x86_64')
url="http://janoc.rd-h.com/"
license=('GPL')
makedepends=('sdl')
source=("http://janoc.rd-h.com/files/software/linux/spacenav/libndofdev-${pkgver}.tar.gz"
        "${pkgname}_${pkgver}_package.diff")
sha512sums=('372b13c4f103126609ee271c394e80f7d681f3d6a543b876db13a39b613ea7669364cd3871265513346a86368856ca673add1662740e0f45a53353d68b0e66f6'
            '21a153692382408d4ebe28f79bce7975f8dc8c141caf16372d4ccb32ea4780367cfd6c7ceef2fde3d94096a0e6656b87a14a7b8a3e35e87b3c63292f9653e55a')

build() {
  cd $srcdir/libndofdev

  # Applying the packaging patch
  patch -p1 < ../${pkgname}_${pkgver}_package.diff || return 1

  # Make and Install
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
