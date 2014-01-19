# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=prozilla-kaptain
pkgver=2.0
pkgrel=1
pkgdesc="Kaptain launcher script for Prozilla."
arch=('any')
url="http://gtk-apps.org/content/show.php/Prozilla+Kaptain+Launcher?content=162866"
license=('GPL3')
depends=('kaptain' 'prozilla' 'xterm')
options=(!emptydirs)
source=(http://gtk-apps.org/CONTENT/content-files/162866-prozilla.kapt_${pkgver}_all.deb)
md5sums=('24e302f1bb729c7533c89cbe986332b6')

package() {
  cd $srcdir
  bsdtar xf data.tar.gz -C $pkgdir
  
  # Fix path
  mv $pkgdir/usr/local/bin $pkgdir/usr/bin
  
  # Fix script name
  mv $pkgdir/usr/bin/prozilla.kapt $pkgdir/usr/bin/prozilla.kaptn
}
