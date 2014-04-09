# Maintainer: danyf90 <daniele.formichelli@gmail.com

pkgname=kdeartwork-colorschemes-next
_themename=Next
pkgver=1
pkgrel=1
pkgdesc="Plasma Next color scheme"
arch=('any')
url=("http://wheeldesign.blogspot.it/2014/03/monday-report-6.html")
license=('GPL')
depends=('kdebase-workspace')
source=("https://dl.dropboxusercontent.com/u/50990622/PlasmaPrototype.tar.gz")
sha512sums=('807e7bc0c3f8802f7b3b2ef409bfab2be25d4e842cb83d28c75478470caa1d7a5add0051c784ed655296f8758fb8921e7e86b9810f0842d20b153d84fda883f2')

package() {
  cd $srcdir

  install -Dm755 PlasmaPrototype/$_themename.colors $pkgdir/usr/share/apps/color-schemes/$_themename.colors
}
