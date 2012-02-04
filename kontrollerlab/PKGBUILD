# Maintainer: Christian Waldherr <woodghost@online.de>
# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=kontrollerlab
pkgver=0.8.0_beta1
_pkgver=0.8.0-beta1
pkgrel=5
pkgdesc="IDE for developing software for Atmel(r) AVR(c) microcontrollers"
arch=('i686')
url="http://sourceforge.net/projects/kontrollerlab/"
license=('GPL')
depends=('kdelibs3')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/kontrollerlab/$pkgname-$_pkgver.tar.bz2)
md5sums=('84345be534ec9fd438118541e09514a7')

build() {
  cd ${srcdir}/$pkgname-$_pkgver
  ./configure --prefix=/opt/kde --without-arts --disable-rpath
  export KDEDIRS=${pkgdir}/usr:/opt/kde
  # rpath removal
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make || return 1
  make prefix=${pkgdir}/usr install || return 1
  rm -rf ${pkgdir}/usr/share/doc/HTML/en/kontrollerlab/common
}
