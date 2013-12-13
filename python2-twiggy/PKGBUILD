# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-twiggy
_realname=Twiggy
pkgver=0.4.5
pkgrel=1
pkgdesc="a more Pythonic logger"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://twiggy.wearpants.org/"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/T/$_realname/$_realname-$pkgver.tar.gz
        https://pypi.python.org/packages/source/T/$_realname/$_realname-$pkgver.tar.gz.asc)
md5sums=('b0dfbbb7f56342e448af4d22a47a339c'
         '28442f4261b3989c6a0d97b8f882da01')
sha256sums=('4e8f1894e5aee522db6cb245ccbfde3c5d1aa08d31330c7e3af783b0e66eec23'
            '334c5926aac36b6f898b4b2ad8cc1d3a8440499f2c56144159bd9375f48d31e4')

prepare(){
  cd $srcdir/$_realname-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd $srcdir/$_realname-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
