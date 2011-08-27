# Maintainer: Vojtech Kral <kral.vojtech at gmail dot com>

pkgname=libatical
pkgver=11.6
pkgrel=1
pkgdesc="libatical shared objects"
arch=('i686' 'x86_64')
url="http://www.ati.amd.com"
license=('unknown/custom')
depends=()
conflicts=('catalyst' 'catalyst-utils' 'catalyst-leaked')
source=(http://www2.ati.com/drivers/linux/ati-driver-installer-${pkgver/./-}-x86.x86_64.run)
sha256sums=('c359a6bb9ae0a5d40e8ddcdd745e36473cfe8e05398c72537f995854d18ff78e')

_libaticaldir=$srcdir/archive_files/arch/x86/usr/lib
[ "$CARCH" = "x86_64" ] && _libaticaldir=$srcdir/archive_files/arch/x86_64/usr/lib64

build() 
{
  msg "Unpacking archive ..."
  /bin/sh ./ati-driver-installer-${pkgver/./-}-x86.x86_64.run --extract archive_files
}

package()
{
  mkdir -p $pkgdir/usr/lib
  install -m755 $_libaticaldir/{libaticalcl.so,libaticaldd.so,libaticalrt.so} $pkgdir/usr/lib/
}
