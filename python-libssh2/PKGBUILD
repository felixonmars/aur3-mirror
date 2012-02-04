#Contributor: Sofian Brabez <sbrabez@gmail.com>
pkgname=python-libssh2
pkgver=1.0.0
pkgrel=1
pkgdesc="Python binding for SSH2 Library"
arch=(any)
url="http://pypi.python.org/pypi/pylibssh2/"
depends=('libssh2')
source=(http://pypi.python.org/packages/source/p/pylibssh2/pylibssh2-${pkgver}.tar.gz)
license=('LGPL')

build()
{
  cd $startdir/src/pylibssh2-$pkgver
  python setup.py install --root=$startdir/pkg
}

md5sums=('4a7045731899c8f4dd7cffeffe0dadc6')

