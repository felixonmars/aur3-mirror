# Maintainer: Elohim <jbdsjunior@live.com>

pkgname=partitionmanager-lang
_pkgname=partitionmanager-lang
pkgver=1.0.3
_pkgver=1.0.3-2.11
pkgrel=2.11
pkgdesc="Latest openSUSE Factory version of lang partitionmanager."
arch=('any')
url=http://www.opensuse.org/
license=('custom')
depends=(partitionmanager-svn)
groups=(kde)
source=("http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_13.1/noarch/$_pkgname-$_pkgver.noarch.rpm")
md5sums=('20f8c983dbabeeb971aff68426094170')

package() {
  cd $srcdir
#  mkdir -p $pkgdir/usr/share/{apps/desktoptheme,licenses/$pkgname}
  cp -R ./usr $pkgdir/
}