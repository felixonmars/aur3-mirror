# Maintainer:  Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=square-icon-theme
_themename=square
pkgver=2.1
pkgrel=2
pkgdesc="Elegance, modern, compatible with Gnome smiliar and KDE. Light and dark variants."
url="http://gnome-look.org/content/show.php/Square?content=163513"
license=('GPL2')
arch=('any')
source=("https://launchpad.net/~noobslab/+archive/ubuntu/icons2/+files/square-icons_2.1%7Evivid%7ENoobslab.com.tar.gz")
sha512sums=('df5ea610a88cf6ca78b578845a151fa1604cccc5e8e40a9913f40c396cbffb5808a0095a4d49e4b84795587c561fd1d39c38615e505a10f2eba2a015088506a5')
options=(!strip)

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/icons
  cp -r $srcdir/$_themename/Square-Dark/ $pkgdir/usr/share/icons/
  cp -r $srcdir/$_themename/Square-Light/ $pkgdir/usr/share/icons/
#  chmod -R 755 $pkgdir/usr/share/icons/Square-Dark
#  chmod -R 755 $pkgdir/usr/share/icons/Square-Light
}

