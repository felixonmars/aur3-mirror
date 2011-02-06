# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>
# Contributor : Vincent Viaud <lsuntzu@gmail.com>

_kernver=2.6.24-tp
pkgname=gspcav1-tp
pkgver=1.00.20
pkgrel=1
pkgdesc="A kernel module with support to 260 USB webcams. For kernel26tp."
arch=('i686' 'x86_64')
url="http://mxhaard.free.fr"
license=('GPL2')
depends=('kernel26tp>=2.6.24')
install=gspcav1-tp.install
source=(http://mxhaard.free.fr/spca50x/Download/gspcav1-20071224.tar.gz)
md5sums=('14853ba1f4edc1e685039fca56e5ebf2')

build() {
  cd $startdir/src/gspcav1-20071224
  sed -i -e "s/KERNEL_VERSION = .*/KERNEL_VERSION = ${_kernver}/" Makefile 
  make || return 1
  
  #Install kernel module
  install -D -m644 gspca.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/media/video/usbvideo/gspca.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
