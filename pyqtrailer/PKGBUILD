# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=pyqtrailer
pkgver=0.6.2
pkgrel=4
pkgdesc="Application for viewing and downloading trailers from apple.com"
arch=('any')
url="https://github.com/sochotnicky/pyqtrailer"
license=('GPL3')
depends=('python2-dateutil' 'python2-pyqt4' 'pytrailer>=0.6.0' 'wget')
source=(http://pypi.python.org/packages/source/p/pyqtrailer/$pkgname-$pkgver.tar.gz)
md5sums=('fae1df518b545f3a3a606422d66eb9bc')

package() {
cd $srcdir/$pkgname-$pkgver

   # Python2 fix
   export PYTHON="/usr/bin/python2"

   # Installation
   python2 setup.py install --root $pkgdir

   # Translations
   cd ./po
   cp *  $pkgdir/usr/share/pyqtrailer/lang

   # Desktop icon
   cd ../xdg $pkgdir/usr/share/pyqtrailer/lang
   install -Dm644 pyqtrailer.svg $pkgdir/usr/share/pixmaps/pyqtrailer.svg
   install -Dm644 pyqtrailer.desktop $pkgdir/usr/share/applications/pyqtrailer.desktop
}
