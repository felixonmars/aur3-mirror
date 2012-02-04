# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Tom K <tom@archlinux.org>

pkgname=rlocate
pkgver=0.5.6
pkgrel=4
_kernver=2.6.25-ARCH
pkgdesc="The rlocate kernel module"
arch=('i686' 'x86_64')
url="http://rlocate.sourceforge.net/"
license=('GPL')
replaces=('rlocate-mod')
conflicts=('mlocate')
depends=('rlocate-utils' 'kernel26')
install=rlocate.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        rlocate-static-lsm.patch)
md5sums=('b834e2b1249fba9138bea29a030de46c'
         '82677b75ed40bea9a53b874d683a52d1')

build() {
  cd $startdir/src/rlocate-$pkgver
  sed 's|test $CONFIG_SECURITY_CAPABILITIES -eq 1|test $CONFIG_SECURITY_CAPABILITIES -eq 0|' \
    -i configure
  patch -Np0 -i ../rlocate-static-lsm.patch
  ./configure --with-kernel=/lib/modules/$_kernver/build \
    --with-moduledir=/lib/modules/${_kernver}/misc --with-rlocate-group=locate
  cd src/rlocate-module
  make || return 1
  install -Dm755 rlocate.ko $startdir/pkg/lib/modules/$_kernver/misc/rlocate.ko

  # tweak the install script for the right kernel version
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    $startdir/$pkgname.install || return 1
}
