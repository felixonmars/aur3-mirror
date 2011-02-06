# Contributor: Giuseppe Calderaro <giuseppecalderaro@gmail.com>

pkgname='ndiswrapper-ice'
_kernver='2.6.32-ice'
pkgver=1.56
pkgrel=1
pkgdesc='Module for NDIS (Windows Network Drivers) drivers supplied by vendors. For kernel26-ice.'
license=('GPL')
arch=('i686' 'x86_64')
url='http://ndiswrapper.sourceforge.net'
install='ndiswrapper.install'
depends=('ndiswrapper-utils' 'kernel26-ice')
source=(http://downloads.sourceforge.net/sourceforge/ndiswrapper/ndiswrapper-$pkgver.tar.gz)
md5sums=('1431f7ed5f8e92e752d330bbb3aed333')

build() {
  cd $startdir/src/ndiswrapper-$pkgver/driver
  make KVERS=$_kernver || return 1
  make DESTDIR=$startdir/pkg KVERS=$_kernver install || return 1
  rm $startdir/pkg/lib/modules/$_kernver/modules.*

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
  # move it to correct kernel directory
  mkdir -p $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper
  mv $startdir/pkg/lib/modules/$_kernver/misc/* $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper/
  rm -r $startdir/pkg/lib/modules/$_kernver/misc/
}

