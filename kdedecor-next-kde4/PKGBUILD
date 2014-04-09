# Maintainer: danyf90 <daniele.formichelli@gmail.com

pkgname=kdedecor-next-kde4
_themename=Next
pkgver=1
pkgrel=2
arch=('any')
pkgdesc="Plasma Next decoration for KDE4.x"
url=("http://wheeldesign.blogspot.it/2014/03/monday-report-6.html")
license=('GPL')
depends=('kdebase-workspace')
source=("https://dl.dropboxusercontent.com/u/50990622/PlasmaPrototype.tar.gz")
sha512sums=('807e7bc0c3f8802f7b3b2ef409bfab2be25d4e842cb83d28c75478470caa1d7a5add0051c784ed655296f8758fb8921e7e86b9810f0842d20b153d84fda883f2')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/apps/aurorae/themes
  mv $srcdir/PlasmaPrototype/plasma-next-aurorae $pkgdir/usr/share/apps/aurorae/themes/$_themename
  mv $pkgdir/usr/share/apps/aurorae/themes/$_themename/$_themename-0.008rc $pkgdir/usr/share/apps/aurorae/themes/$_themename/${_themename}rc
  chmod 755 -R $pkgdir/usr/share/apps/aurorae/themes/$_themename
}
