# Maintainer: Marco Scarpetta
# Contributor: Alexandre Courbot

pkgname=photofilmstrip
pkgver=2.0.0_RC1
pkgrel=1
pkgdesc="Creates movies out of pictures using a Ken Burns effect"
arch=(any)
url=http://www.photofilmstrip.org/
license=(GPL)
depends=(python2-pillow wxpython2.8 mencoder)
install="photofilmstrip.install"
source=("http://downloads.sourceforge.net/project/photostoryx/photofilmstrip/2.0.0-RC1/photofilmstrip-2.0.0.tar.gz")
md5sums=('0d5025264cdbfdfcfd81071913b02f8c')

package()
{
  cd $srcdir/photofilmstrip-2.0.0
  sed -i "s|import\ Image|from\ PIL\ import\ Image|" "$pkgname/core/PILBackend.py"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  chmod a+r ${pkgdir}/usr/share -R
}