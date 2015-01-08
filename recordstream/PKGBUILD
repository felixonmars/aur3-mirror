# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=recordstream
pkgver=0.9.7
pkgrel=4
pkgdesc="This Amarok script helps you to record a stream and listen to another one at the same time."
arch=('any')
url="http://www.kde-apps.org/content/show.php/RecordStream?content=107095"
license=('GPL')
depends=('mplayer' 'streamripper')
source=(http://kde-apps.org/CONTENT/content-files/107095-RecordStream.amarokscript.tar.gz)
md5sums=('fd6f7fb956272189176c5a1f9d867502')

package() {
  cd $srcdir/RecordStream

  install -d $pkgdir/usr/share/apps/amarok/scripts/$pkgname
  install -m644 * $pkgdir/usr/share/apps/amarok/scripts/$pkgname
}
