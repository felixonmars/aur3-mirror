# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=whitey
pkgver=0.4
pkgrel=1
pkgdesc="Command-line YouTube client"
arch=('any')
url="http://pypi.python.org/pypi/whitey/"
license=('Apache')
depends=('mplayer' 'ncurses' 'python2-setuptools' 'youtube-dl')
source=(http://pypi.python.org/packages/source/w/whitey/$pkgname-$pkgver.tar.gz)
md5sums=('ba4d2d783c84aef345a11f4934ebe4fd')

package() {
   cd $srcdir/$pkgname-$pkgver

   python2 setup.py install --root=$pkgdir --optimize=1
   rm $pkgdir/usr/bin/pi-yt
}