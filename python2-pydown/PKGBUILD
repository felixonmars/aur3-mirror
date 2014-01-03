# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pydown
pkgver=0.1.0
pkgrel=2
pkgdesc="HTML5 presentation builder written in Python"
arch=('any')
depends=('python2' 'python2-markdown' 'python2-pygments')
url="http://isnowfy.github.io/pydown/"
license=('MIT')
source=(https://pypi.python.org/packages/source/p/python-${pkgname#python2-}/python-${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('6bfea5b9fe80f11cc0611d01c639fdb8')
sha256sums=('3ea055065c8de193f033fc5b684be0868570306b35f538ea844cdb68de719329')
provides=('pydown' 'python2-pydown' 'python-pydown')
conflicts=('pydown' 'python2-pydown' 'python-pydown')

prepare() {
  cd $srcdir/python-${pkgname#python2-}-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/python-${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/python-${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1 

  rm -rf ${pkgdir}/usr/lib/python2.7/site-packages/markdown
  rm -rf ${pkgdir}/usr/lib/python2.7/site-packages/pygments
}
