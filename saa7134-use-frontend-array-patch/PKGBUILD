# Maintainer: jarrebylove@gmail.com
pkgdesc="Patch for saa7134 linux module allows to pass multiple values (comma separated) to use_frontend parameter. Useful if you have multiple saa7134 based cards.[MB}!"
pkgname=('saa7134-use-frontend-array-patch')
pkgrel=1
_basekernel=3.4.9
pkgver=${_basekernel}
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
arch=(i686 x86_64)
url="http://www.kernel.org"
source=(http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2
        saa7134-use-frontend-array.patch)
md5sums=('0428dcd244b494e99da9a314667c6f99'
         '426d546c09c3415b802bc87fee9db3ef')

build() {
  cd ${srcdir}/linux-$_basekernel
  patch -Np1 -i ${srcdir}/saa7134-use-frontend-array.patch
  cd ${srcdir}/linux-$_basekernel/drivers/media/video/saa7134
  mkdir -p ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/media/video/saa7134
  make -C /lib/modules/`uname -r`/build M=$(pwd) modules
  install -m0644 *.ko $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/media/video/saa7134
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}
