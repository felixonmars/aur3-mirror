# Maintainer: Gordin <9ordin @t gmail d@t com>

pkgname=mkinitcpio-vbox
pkgver=2.0
pkgrel=3
pkgdesc="VirtualBox hook for mkinitcpio that rebuilds kernel modules on next reboot"
arch=(i686 x86_64)
license=('GPL')
url='http://aur.archlinux.org/packages.php?ID=41021'
groups=()
depends=('mkinitcpio' 'virtualbox')
install=hook.install
source=('virtualbox')
sha1sums=('67f4c8df5fd77281d8fa223a5b056778d0892bfa')

build()
{
  install -o root -g root -D $srcdir/virtualbox $pkgdir/lib/initcpio/install/virtualbox
}
