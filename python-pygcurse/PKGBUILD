# Maintainer: kiooeht <kiooeht at gmail dot com>

_pkgname=pygcurse
pkgname=python-$_pkgname
pkgver=0.1
pkgrel=1
pkgdesc="A curses library emulator that runs on top of the Pygame framework"
arch=('any')
url="http://inventwithpython.com/pygcurse/"
license=('BSD')
depends=('python' 'python3-pygame-svn')
options=(!emptydirs)
source=('http://inventwithpython.com/pygcurse/pygcurse_src.zip'
        'setup.py'
        'LICENSE')
md5sums=('b50382a860ff9b9e4f763ae8a7abb52e'
         '2d5a50ae30e90bcd143646de2f01aad8'
         '537de36845050619300e2ebac152ce5c')

package() {
  cd "$srcdir"
  python setup.py install --root=$pkgdir --optimize=1

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
