#Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=pycparser
pkgver=2.04
pkgrel=1
pkgdesc="C parser and AST generator written in Python"
url="http://code.google.com/p/pycparser/"
depends=('python' 'ply')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://pycparser.googlecode.com/files/${pkgname}-${pkgver}.zip)
md5sums=('bc652c2ee023efdd37a67aa92ca88359')

build() 
{
  cd $startdir/src/${pkgname}-${pkgver}
  python setup.py install --root=$startdir/pkg/
}
