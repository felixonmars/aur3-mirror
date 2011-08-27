# Maintainer: Chris Baker <baker.chris.3@gmail.com>
pkgname=pyopt
pkgver=0.71
pkgrel=1
pkgdesc="A module for command-line options with a pythonic, decorator-centric syntax."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyopt/"
license=('BSD')
depends=(python3)
source=(http://pyopt.googlecode.com/files/$pkgname.$pkgver.zip)
md5sums=('ce681f8fcb90cd3ef28ee606754de3dd')

build() {
  mkdir -p $pkgdir/usr/lib/python3.1/site-packages
  install -m 644 $srcdir/$pkgname.py $pkgdir/usr/lib/python3.1/site-packages/$pkgname.py
}
