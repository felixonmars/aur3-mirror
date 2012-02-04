# Contributor: Rad3k <trueradzian at o2 dot pl>

pkgname=mkinitcpio-mmc
pkgver=1.1
pkgrel=1
pkgdesc="mmc/sd card hook for mkinitcpio"
arch=(any)
url="http://bbs.archlinux.org/viewtopic.php?id=82085"
license=('GPL')
groups=()
depends=('mkinitcpio' 'udev')
source=('mmc-install')
md5sums=('82f3f8e6379f364ab041329407eb4c9e')

build()
{
  install -o root -g root -D $srcdir/mmc-install $pkgdir/lib/initcpio/install/mmc
}
