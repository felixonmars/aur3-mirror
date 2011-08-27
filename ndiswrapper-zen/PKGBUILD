# Contributor: d'Ronin <daronin@2600.com>

pkgname='ndiswrapper-zen'
_kernver='2.6.25-zen'
pkgver='1.53'
pkgrel='1'
pkgdesc='Module for NDIS (Windows Network Drivers) drivers supplied by vendors. For kernel26zen'
license=('GPL')
arch=('i686' 'x86_64')
url='http://ndiswrapper.sourceforge.net'
install='ndiswrapper.install'
depends=('ndiswrapper-utils' 'kernel26zen')
source=(http://easynews.dl.sourceforge.net/sourceforge/ndiswrapper/ndiswrapper-$pkgver.tar.gz)
md5sums=('393c6e6ab0803963148e18538601cdec')

build() {
  cd $startdir/src/ndiswrapper-$pkgver/driver
  make KVERS=$_kernver 
  make DESTDIR=$startdir/pkg KVERS=$_kernver install || return 1
  rm $startdir/pkg/lib/modules/$_kernver/modules.*

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
