# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap
pkgver=0.2.2_beta1
pkgrel=1
pkgdesc="Medical image viewer and DICOM client"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/aeskulap"
license=('GPL')
depends=('libglademm' 'gconfmm' 'hicolor-icon-theme')
makedepends=('perlxml' 'patch')
options=('!libtool')
install=$pkgname.install
source=(http://www.bms-austria.com/~pipelka/aeskulap/aeskulap-0.2.2-beta1.tar.gz \
        $pkgname-gcc.patch)
md5sums=('33a0f8659909426c67bebc10bd61b1d0'
         'ed39ad48d76bf8238c45a7b6e9c31b2e')

build() {
  cd ${srcdir}/$pkgname-0.2.2-beta1

  patch -Np0 -i ${srcdir}/$pkgname-gcc.patch || return 1

  ./configure --prefix=/usr --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make || return 1
  make DESTDIR=${pkgdir} install
}
