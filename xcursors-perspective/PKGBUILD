# Maintainer: danyf90 <daniele.formichelli@gmail.com>

_themename=perspective
_Themename=Perspective
pkgname=xcursors-$_themename
pkgver=1.0
pkgrel=1
pkgdesc="Plasma Next theme X.org server cursors"
arch=('any')
url="http://packages.debian.org/unstable/x11/oxygencursors"
license=('GPL')
source=("http://kde-look.org/CONTENT/content-files/164507-$_Themename.tar.gz")
sha512sums=('bece90d980134e834ef2d081fc853848bc925d28d28b249d5011f5f783b1b9b338b46539bbed141f529f78f93f15609e05de3c4a7207d03b6b3326cf9aaa9f65')

package() {
  cd $srcdir/$_Themename

  install -d $pkgdir/usr/share/icons/$_Themename
  cp -r cursors $pkgdir/usr/share/icons/$_Themename/

}