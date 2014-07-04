# Maintainer: Kamil Wiśniewski (FORMOZA) <formoza@autistici.org>

pkgname=abstraktreflections-archlinux-wallpapers
pkgver=1.0
pkgrel=3
pkgdesc="Wallpapers for Archlinux with Archlinux logotype. Package contains 42 wallpapers."
arch=(any)
url="https://bbs.archlinux.org/viewtopic.php?id=183710"
license=('GPL')
depends=(xorg-server)
install=$pkgname.install
source=(https://www.dropbox.com/s/fabki7s1nqg26ov/AbstraktReflections-AUR.zip)
md5sums=('84d2f35664ae987629e92307ee62adc9')

package() 
{
  mkdir -p $pkgdir/usr/share/wallpapers/AbstraktReflections
  cp $srcdir/*png $pkgdir/usr/share/wallpapers/AbstraktReflections
}