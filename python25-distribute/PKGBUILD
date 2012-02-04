# Maintainer: Blake Imsland <blake@retroco.de>

pkgname=python25-distribute
pkgver=0.6.24
pkgrel=1
pkgdesc="Easily build and distribute Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/distribute"
depends=('python25')
conflicts=('python25-setuptools')
replaces=('python25-setuptools')
provides=('python25-setuptools=0.6c11')
source=(http://pypi.python.org/packages/source/d/distribute/distribute-$pkgver.tar.gz
        python25.patch)
md5sums=('17722b22141aba8235787f79800cc452'
         '84b949df562f1c2b13e6cd580b418d60')

build() {
  cd $srcdir/distribute-$pkgver

  patch -Np1 -i $srcdir/python25.patch

  sed -i setuptools/tests/test_resources.py \
    -e 's|^#!.*/usr/bin/python.*|#!/usr/bin/python2.5|'

  python2.5 setup.py build
  python2.5 setup.py test
}

package() {
  cd $srcdir/distribute-$pkgver

  python2.5 setup.py install --prefix=/usr --root=$pkgdir --optimize=1 --skip-build
}
