# Maintainer: Ray Powell <ray_al@xphoniexx.net>

pkgname=libunrar
pkgsrcname=unrar
pkgver=4.0.7
pkgrel=1
pkgdesc="libunrar is part of the RAR compression program.  This library is needed by calibre to manipulate rar files"
arch=('i686' 'x86_64')
url="http://www.rarlab.com/rar_add.htm"
license=('custom')
depends=('gcc-libs')
source=("http://www.rarlab.com/rar/unrarsrc-${pkgver}.tar.gz" 'makefile.unix.patch')
md5sums=('41b0a9bca945b4ae2608421afd8f606e' '4418970ba2a3a6dd2d3849d27ff49843')

build() {
  cp makefile.unix.patch ${srcdir}/${pkgsrcname}/
  cd "${srcdir}/${pkgsrcname}"
  patch makefile.unix < makefile.unix.patch
  make -f makefile.unix lib
  install -Dm755 libunrar.so ${pkgdir}/usr/lib/libunrar.so || return 1
  # install license
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
