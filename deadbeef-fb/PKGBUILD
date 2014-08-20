# $Id$
# Maintainer: FadeMind <fademind@gmail.com>

pkgname=deadbeef-fb
pkgver=20140316
pkgrel=1
pkgdesc="File Browser plugin for the Deadbeef Music Player"
arch=('any')
url="http://deadbeef-fb.sourceforge.net/"
license=('GPL2')
depends=('deadbeef')
provides=('deadbeef-fb-git')
conflicts=('deadbeef-fb-git')
source=("http://softlayer-ams.dl.sourceforge.net/project/deadbeef-fb/master/deadbeef-fb_20140316.tar.gz")
md5sums=('0d6952a9aa69f64da03eab1840d2eb45')

package() {
   cd $srcdir/
   install -dm755  $pkgdir/usr/lib/deadbeef/
   cp -rf  *.so $pkgdir/usr/lib/deadbeef/
}
