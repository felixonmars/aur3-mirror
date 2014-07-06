# Maintainer: Kamil Wisniewski (FORMOZA) <formoza@autistici.org>

pkgname=abstraktreflections-archlinux-wallpapers
pkgver=1.0
pkgrel=4
pkgdesc="Wallpapers for Archlinux with Archlinux logotype. Package contains 60 wallpapers."
arch=(any)
url="https://bbs.archlinux.org/viewtopic.php?id=183710"
license=('GPL')
install=$pkgname.install
source=(https://www.dropbox.com/s/ejpajg1xlqisqcc/AbstraktReflections-AUR.zip)
md5sums=('ddb7e95258e61c79cdddd9b1ea688233')

package() 
{
  mkdir -p $pkgdir/usr/share/wallpapers/AbstraktReflections
  cp -R $srcdir/*png $pkgdir/usr/share/wallpapers/AbstraktReflections
  mkdir -p $pkgdir/usr/share/backgrounds/AbstraktReflections
  cp -R $srcdir/*png $pkgdir/usr/share/backgrounds/AbstraktReflections
}