# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Nate Slottow (m00tp01nt) <nslottow AT gmail DOT com>

pkgname=zyn
pkgver=1
pkgrel=5
pkgdesc="The ZynAddSubFX synth engines ported to LV2 plugin format."
arch=('i686' 'x86_64')
url="http://home.gna.org/zyn/"
license=('GPL')
depends=('lv2core' 'lv2dynparam1' 'fftw')
source=("http://download.gna.org/zyn/$pkgname-$pkgver.tar.bz2")
md5sums=('ead0a8db5440e480c8a23441195a76df')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Namespace Fix
  sed -i "s/\({ int\)/_zyn_filter_processor_handle \1/" filter_common.h

  # -Werror=unused-but-set-variable fix
  sed -i "/masterkeyshift/d" addsynth.cpp

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/lib/lv2"
  make LV2_INSTALL_PATH="$pkgdir/usr/lib/lv2" install
}