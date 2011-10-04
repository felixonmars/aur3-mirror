# Maintainer: vaca
pkgdesc="Sasc-ng kernel26 patch"
pkgname=('sascng-kernel26-patch')
pkgrel=3
_basekernel=2.6.39
pkgver=${_basekernel}
license=('GPL')
depends=('kernel26>=2.6.39' 'kernel26<3.0')
makedepends=('kernel26-headers>=2.6.39' 'kernel26-headers<3.0')
arch=(i686 x86_64)
url="http://www.kernel.org"
source=(http://kernelorg.mirrors.tds.net/pub/linux/kernel/v2.6/linux-$_basekernel.tar.bz2
       	sasc-ng.patch)
md5sums=('1aab7a741abe08d42e8eccf20de61e05'
         '61441a8b4494b70ef06fde2c8a855818')

build() {
  cd ${srcdir}/linux-$_basekernel
  patch -Np1 -i ${srcdir}/sasc-ng.patch

  cd ${srcdir}/linux-$_basekernel/drivers/media/dvb/dvb-core
  mkdir -p ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/media/dvb/dvb-core
  make -C /lib/modules/2.6.39-ARCH/build M=$(pwd) modules
  install -m0644 dvb-core.ko $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/media/dvb/dvb-core
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

 
}

