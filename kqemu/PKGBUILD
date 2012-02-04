#Conributor: Carlos Franke <carlos_franke at lemtank dot de>
#Conributor: Vamp898 <vamp898 at web dot de>
#Conributor kfgz <kfgz at interia dot pl>

pkgname=kqemu
pkgver=1.4.0pre1
pkgrel=8
pkgdesc="QEMU Accelerator Module, which adds virtualization capabilities to qemu. For kernel26."
arch=('i686' 'x86_64')
license=('GPL2' 'BSD')
url="http://www.nongnu.org/qemu/"
depends=("qemu<0.12")
makedepends=('kernel26-headers')
install=${pkgname}.install
source=(${url}/${pkgname}-${pkgver}.tar.gz
        kqemu-1.4.0_pre1-init_MUTEX.patch)
md5sums=('d738d8ca7332211ab716ec3213d82ee1'
         'df7cb0c7036ee8cca69e76d9ace3725b')

build() {
  cd ${srcdir}
  patch -Np1 -i ${srcdir}/kqemu-1.4.0_pre1-init_MUTEX.patch
  
  cd ${srcdir}/${pkgname}-${pkgver}
  #sed -i "s|-Werror||g" tests/Makefile
  #sed -i "s|-Werror||g" common/Makefile
  ./configure --kernel-path=/lib/modules/`uname -r`/build
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m644 kqemu.ko ${pkgdir}/lib/modules/`uname -r`/misc/kqemu.ko
  #sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION="`uname -r`"/" ${startdir}/kqemu.install
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
} 
