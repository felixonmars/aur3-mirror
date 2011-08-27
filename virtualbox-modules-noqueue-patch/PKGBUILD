# Maintainer: Martti Kühne <mysatyre@gmail.com>
pkgname=virtualbox-modules-noqueue-patch
pkgdesc="Compiles virtualbox modules, applies noqueue patch on vboxnetflt"
pkgver=1.0
pkgrel=3
arch=('i686' 'x86_64')
url='http://www.virtualbox.org/ticket/7908'
license=('GPL' 'custom')
depends=('virtualbox=4.0.0')
source=('http://www.virtualbox.org/attachment/ticket/7908/qdisc_noqueue.patch?format=raw')
install="$pkgname.install"
md5sums=('94505841fd3bab2bea0b3b254da21d2c')

build() {
  [[ -d "$srcdir/usr/lib/virtualbox" ]] && rm -r "$srcdir/usr/lib/virtualbox"
  mkdir -p "$srcdir/usr/lib/virtualbox"
  cp -r /usr/lib/virtualbox/src "$srcdir/usr/lib/virtualbox"
  cd "$srcdir/usr/lib/virtualbox/src"
  patch -Np2 <"$srcdir/qdisc_noqueue.patch?format=raw"
  make
}

package() {
  cd "$srcdir/usr/lib/virtualbox/src"
  make MODULE_DIR="$pkgdir/lib/modules/$(uname -r)/misc" install
}
