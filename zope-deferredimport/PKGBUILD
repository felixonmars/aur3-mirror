# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=zope-deferredimport
pkgver=3.5.0
pkgrel=1
pkgdesc="Allows you to perform imports names that will only be resolved when used in the code"
arch=('i686' 'x86_64')
# Waiting for AUR to support these notations
#url="http://cheeseshop.python.org/pypi/${pkgname//-/.}/"
url="http://cheeseshop.python.org/pypi/zope.deferredimport/"
license=('ZPL')
depends=('python' 'zope-proxy')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/z/${pkgname//-/.}/${pkgname//-/.}-$pkgver.tar.gz)
md5sums=('0e75cde9c09ac7afeda9af417b102112')

build() {
  cd $startdir/src/${pkgname//-/.}-$pkgver
  python setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}
