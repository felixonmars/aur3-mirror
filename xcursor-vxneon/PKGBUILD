# Contributor: MagicFish1990 <magicfish1990@gmail.com>

pkgname=xcursor-vxneon
pkgver=0.22 
pkgrel=2
pkgdesc="vxNeon X Cursor Theme"
url="http://kde-look.org/content/show.php?content=157292"
depends=('libxcursor')
license=('GPL')
arch=(any)
source=(http://kde-look.org/CONTENT/content-files/157292-JYxNeon022.tar.gz)

package(){
  mkdir -p $pkgdir/usr/share/icons
  cp -dpr --no-preserve=ownership $srcdir/JYxNeon $pkgdir/usr/share/icons/
}

md5sums=('c05b26bd075d880a202ee1097f0d6bb7')
