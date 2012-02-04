# Maintainer: Noctivivans <noctivivans@gmail.com>

pkgname=compal-laptop-all
_pkgname=compal-laptop
pkgver=0.2.10
pkgrel=4
pkgdesc="Module for Compal laptops. Builds modules for all (2.6.34 and higher) installed kernels "
url="http://eko.one.pl/index.php?page=compal-laptop"
arch=('i686' 'x86_64')
license=('GPL')
source=("http://eko.one.pl/files/compal/${_pkgname}-${pkgver}.tar.bz2" 'patch.Makefile')
depends=('kernel26-headers')
conflicts=('compal-laptop')
provides=('compal-laptop')
md5sums=('8e58501eea9fc24419207a6bfe9c1f8d' '82d98482fee7eb0447d69d98367eb271')

build() {
  cd ${startdir}/src/${_pkgname}-${pkgver}
  # remove KERNEL_VERSION variable from makefile
  patch -i ../patch.Makefile
  find /lib/modules/ -maxdepth 1 -mindepth 1 -type d | while read N 
  do
    _kernver=(`basename $N`)
    # ignore kernels lower than 2.6.34 and folders with orphaned modules
    # Warning! Script assumes that you have kernels names like 2.6.??-name (?? is tested number)
    if [ ${_kernver:4:2} -gt 33 -a -d $N/build ] 
      then
        msg2 "Building module for $_kernver..."
        KERNEL_VERSION=${_kernver} make
        # install module
        INST=/lib/modules/${_kernver}/kernel/drivers/platform/x86/
        mkdir -p ${startdir}/pkg/${INST}
        cp compal-laptop.ko ${startdir}/pkg/${INST}/compal-laptop-new.ko
        make clean
      fi
  done
}

