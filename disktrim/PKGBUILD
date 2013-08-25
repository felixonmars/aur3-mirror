# Contributor: Mathias <mathias.buren@gmail.com>

pkgname=disktrim
pkgver=0.09
pkgrel=2
pkgdesc="Automated graphical user interface for wiper.sh"
arch=(i686 x86_64)
license=('GPL3')
url="http://sourceforge.net/projects/disktrim/"
depends=('wiper')
source=(http://downloads.sourceforge.net/project/disktrim/Linux/source/DiskTRIM_Source_$pkgver.tar.gz \
	"wiper-location" "DiskTRIM.desktop")
install="disktrim.install"
md5sums=('e19b337ed2cd7d0d50ddeff9f6e95bca'
         'be24dfcd45d2405b915c906433de594e'
         'bbe39a2df0e4c1fb364460a7ab4350dc')

build() {
  cd $srcdir/DiskTRIM_Source_$pkgver
  make
}

package() {
  mkdir $pkdir/usr/share
  cp -R $srcdir/DiskTRIM_Source_$pkgver/deb/usr/share/* $pkgdir/usr/share/
  install -D --mode=0755 $srcdir/DiskTRIM_Source_$pkgver/disktrim $pkgdir/usr/bin/disktrim
  install -D --mode=0755 $srcdir/DiskTRIM.desktop $pkgdir/usr/share/applications/DiskTRIM.desktop
  install -D --mode=0644 $srcdir/wiper-location $pkgdir/etc/disktrim/wiper-location
}
