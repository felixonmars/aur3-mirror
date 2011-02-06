# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=zope-proxy
pkgver=3.5.0
pkgrel=1
pkgdesc="Zope Generic Transpatent Proxies"
arch=('i686' 'x86_64')
# Waiting for AUR to support these notations
#url="http://cheeseshop.python.org/pypi/${pkgname//-/.}/"
url="http://cheeseshop.python.org/pypi/zope.proxy/"
license=('ZPL')
depends=('python')
makedepends=('setuptools' 'zope-interface')
optdepends=('zope-testing : For testing !')
source=(http://pypi.python.org/packages/source/z/${pkgname//-/.}/${pkgname//-/.}-$pkgver.tar.gz)
md5sums=('ac5fc916b572bc3ff630b49cda52d94a')

build() {
  cd $startdir/src/${pkgname//-/.}-$pkgver
  python setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}
