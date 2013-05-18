# Maintainer: vaca
pkgdesc="Sasc-ng linux3 patch"
pkgname=('sascng-linux3-patch')
pkgrel=1
install=sascng-linux3-patch.install
_basekernel=3.9
pkgver=${_basekernel}
license=('GPL')
depends=('linux>=3.9' 'linux<3.10')
makedepends=('linux-headers>=3.9' 'linux-headers<3.10')
arch=(i686 x86_64)
url="http://www.kernel.org"
source=(http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2       	sasc-ng.patch)
md5sums=('2220321a0a14d86200322e51dd5033e2'
         'a65248d6e7f410c395ebb61d6f7ca5df')

build() {
  cd ${srcdir}/linux-$_basekernel
  patch -Np1 -i ${srcdir}/sasc-ng.patch

  cd ${srcdir}/linux-$_basekernel/drivers/media/dvb-core
  mkdir -p ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/media/dvb-core
  make -C /lib/modules/`uname -r`/build M=$(pwd) modules
  install -m0644 dvb-core.ko $startdir/pkg/sascng-linux3-patch/lib/modules/`uname -r`/kernel/drivers/media/dvb-core
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

 
}

