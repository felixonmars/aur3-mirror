# $Id: #
# Maintainer: Gustavo Chain <g@0xff.cl>

pkgname=pyxser
pkgver=1.0rc1
pkgrel=1
pkgdesc="pyxser stands for python xml serialization and is a python object to XML serializer that validates every XML deserialization against the pyxser 1.0 DTD."
url="http://coder.cl/software/pyxser"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python')
source=("http://ufpr.dl.sourceforge.net/sourceforge/pyxser/$pkgname-$pkgver.tar.gz")
md5sums=('c9ae813765b8b24ddc75d0e61e3c8de8')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
}

