# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=zk-shell
_appname=${pkgname/_/-}
pkgver=1.0.0
pkgrel=1
pkgdesc='A powerful & scriptable shell for Apache ZooKeeper'
arch=('any')
url='https://github.com/rgs1/zk_shell'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-zk-kazoo')
source=(${pkgname}-${pkgver}.tgz::https://github.com/rgs1/${_appname}/archive/v${pkgver}.tar.gz)
sha256sums=('6dd44a843f6add53a2d39e7f9669b0146983c9828ef0c2dc90ce42f01842a82e')

build() {
  cd "${srcdir}/${_appname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_appname}-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}"
}
