# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=zc.buildout
pkgname=python-$_relname
pkgver=1.5.2
pkgrel=4
pkgdesc='System for managing development buildouts'
arch=('any')
url='http://pypi.python.org/pypi/zc.buildout'
license=('ZPL')
depends=('python2' 'python2-distribute')
source=(http://pypi.python.org/packages/source/z/$_relname/$_relname-$pkgver.tar.gz)
md5sums=('87f7b3f8d13926c806242fd5f6fe36f7')

build() {
  true
}

package() {
  cd $srcdir/$_relname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
  install -Dm644 $pkgdir/usr/README.txt $pkgdir/usr/share/doc/$_relname/README.txt
  rm -f $pkgdir/usr/README.txt
  # Make sure egg-info files is readable for everybody
  chmod 644 $pkgdir/usr/lib/python2.7/site-packages/zc.buildout-$pkgver-py2.7.egg-info/*
}

# vim:ts=2:sw=2:et:
