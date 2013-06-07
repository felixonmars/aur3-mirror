# Contributor: j dot lahav at gmail dot com
pkgname=xcursor-gruppled-lite
_pkgname=gruppled_lite
pkgver=1.1
pkgrel=2
pkgdesc="Lite version of xcursor-gruppled"
arch=(any)
url="http://www.gnome-look.org/content/show.php/Gruppled+Cursors?content=86081"
license=('GPL')
depends=()
source=(http://www.gnome-look.org/CONTENT/content-files/86145-$_pkgname.tar.gz)
md5sums=('4e86b0634edb3c82739de1c5ea7d70c9')

package() {
  mkdir -p $pkgdir/usr/share/icons/
  cp -r $srcdir/gruppled_white_lite $pkgdir/usr/share/icons/
  cp -r $srcdir/gruppled_black_lite $pkgdir/usr/share/icons/
}
