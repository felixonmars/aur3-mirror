# Contributor: dkessler@operamail.com
pkgname=lt_hotswap
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool for hotswapping IBM ThinkPad UltraBay devices."
url="http://www.sourceforge.net/projects/lths"
license=""
depends=('glibc' 'acpid')
makedepends=()
conflicts=()
replaces=()
backup=()
install="lt_hotswap.install"
source=(http://easynews.dl.sourceforge.net/sourceforge/lths/$pkgname-$pkgver.tar.gz)
md5sums=('19b787a1d7139f701abdbc86da7848cc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/lib/modules/2.6.15-ARCH/kernel/drivers/acpi
  mkdir -p $startdir/pkg/etc/acpi/events
  cp $startdir/src/$pkgname-$pkgver/lt_hotswap.ko $startdir/pkg/lib/modules/2.6.15-ARCH/kernel/drivers/acpi
  cp $startdir/src/$pkgname-$pkgver/config/lths $startdir/pkg/etc/acpi/events
  sed -i 's/usr\/local\/sbin/etc\/acpi/' $startdir/pkg/etc/acpi/events/lths
  cp $startdir/src/$pkgname-$pkgver/config/lths.sh $startdir/pkg/etc/acpi
}
