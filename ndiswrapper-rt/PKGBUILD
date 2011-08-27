# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=ndiswrapper-rt
_kernver=2.6.26-rt
pkgver=1.53
pkgrel=1
pkgdesc="Module for NDIS (Windows Network Drivers) drivers supplied by vendors. For kernel26rt."
license=('GPL')
arch=(i686 x86_64)
url="http://ndiswrapper.sourceforge.net"
install=$pkgname.install
depends=("ndiswrapper-utils=$pkgver" "kernel26rt>=2.6.26.5_rt9" "kernel26rt<2.6.27")
source=(http://downloads.sourceforge.net/ndiswrapper/ndiswrapper-$pkgver.tar.gz)

build() {
  cd "$srcdir/ndiswrapper-$pkgver/driver"
  
  make KVERS=$_kernver
  make DESTDIR=$pkgdir KVERS=$_kernver install || return 1
  rm "$pkgdir/lib/modules/$_kernver/modules."*

  sed -i "s/KERNEL_VERSION='.*'/KERNEL_VERSION='$_kernver'/" \
    "$startdir/$install"
  
  # move it to correct kernel directory
  mkdir -p "$pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper"
  mv "$pkgdir/lib/modules/$_kernver/misc/"* \
    "$pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper/"
  rm -r "$pkgdir/lib/modules/$_kernver/misc/"
}
md5sums=('393c6e6ab0803963148e18538601cdec')
