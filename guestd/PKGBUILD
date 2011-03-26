# Maintainer: RetroX <classixretrox@gmail.com>
pkgname=guestd
pkgver=2.0
pkgrel=2
pkgdesc="A simple daemon to create a guest account that automatically resets settings on shutdown."
arch=('any')
url="http://bbs.archlinux.org/viewtopic.php?id=94320"
license=('GPL')
backup=('etc/rc.d/guestd')
depends=('coreutils')
makedepends=('pkgconfig' 'coreutils')
install=guestd.install
source=('guestd')
md5sums=('16105c2a7089d64ca65e3b6a5db8e62a')

build()
{
  mkdir -p $pkgdir/etc/rc.d $pkgdir/home/{guest,guest-permanent}
  touch $pkgdir/home/guest-permanent/.keep
  cp $srcdir/guestd $pkgdir/etc/rc.d/guestd
}
