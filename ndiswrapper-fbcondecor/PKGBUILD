#$Id: PKGBUILD 31227 2009-03-25 08:50:45Z tpowa $
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Modified for fbcondecor : Gregory T Helton <gt@fallendusk.org> #

pkgname=ndiswrapper-fbcondecor
_kernver=2.6.29-fbcondecor
pkgver=1.54
pkgrel=1
pkgdesc="Module for NDIS (Windows Network Drivers) drivers supplied by vendors. For fbcondecor 2.6 kernel."
license=('GPL')
arch=(i686 x86_64)
url="http://ndiswrapper.sourceforge.net"
install="ndiswrapper.install"
depends=("ndiswrapper-utils=$pkgver" 'kernel26-fbcondecor>=2.6.29' 'kernel26-fbcondecor<2.6.30')
source=(http://downloads.sourceforge.net/sourceforge/ndiswrapper/ndiswrapper-$pkgver.tar.gz
        2.6.29.patch)
md5sums=('fc9ebd3985967727da494ec298ad4487'
         'dac17893de1ac41488c9ae9c2dcfbfad')
build()
{
  cd $srcdir/ndiswrapper-$pkgver/driver
  patch -Np0 -i ../../2.6.29.patch || return 1
  make KVERS=$_kernver || return 1
  make DESTDIR=$pkgdir KVERS=$_kernver install || return 1
  rm $pkgdir/lib/modules/$_kernver/modules.* #wtf?

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
  # move it to correct kernel directory
  mkdir -p $pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper
  mv $pkgdir/lib/modules/$_kernver/misc/* $pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper/
  rm -r $pkgdir/lib/modules/$_kernver/misc/
}
