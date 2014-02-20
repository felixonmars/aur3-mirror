# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=bespin-kdm-svn
_projectname=bespin
pkgver=1711
pkgrel=1
pkgdesc="Bespin KDM theme"
arch=(any)
makedepends=()
url="http://kde-look.org/content/show.php/Bespin?content=63928"
license=('LGPL')
source=("bespin::svn+http://svn.code.sf.net/p/cloudcity/code")
md5sums=('SKIP')

pkgver() {
  cd $_projectname
  svnversion
}

package() {
  cd $_projectname

  mkdir -p $pkgdir/usr/share/apps/kdm/themes/Bespin
  cp -r $srcdir/$_projectname/kdm/* $pkgdir/usr/share/apps/kdm/themes/Bespin/
  mv $pkgdir/usr/share/apps/kdm/themes/Bespin/tibanna $pkgdir/usr/share/apps/kdm/themes/
}
