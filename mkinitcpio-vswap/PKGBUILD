#Maintainer: Di Abel (thc_flow) <thc@thc.soa1.org>

pkgname=mkinitcpio-vswap
pkgver=1.0
pkgrel=1
arch=('any')
pkgdesc='Use VRAM as swap device'
url='http://thc.soa1.org'
license=('GPL')
depends=('mkinitcpio')
source=('vswap-install' 'vswap-hook' 'vswap.conf')

md5sums=('3a4cbcdf9d8ef72f57808c75c7433253'
         'e839f44b2ee91ff7060a5c909c822878'
         '7fa2273ad50a56a4526c9711324515bd')

build() {
  install -m644 -D $srcdir/vswap-install $pkgdir/usr/lib/initcpio/install/vswap
  install -m644 -D $srcdir/vswap-hook $pkgdir/usr/lib/initcpio/hooks/vswap
  install -m644 -D $srcdir/vswap.conf $pkgdir/etc/modprobe.d/vswap.conf
}
