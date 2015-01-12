# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
_appname=kazoo
pkgname=python-zk-${_appname}
pkgver=2.0
pkgrel=1
pkgdesc='A higher level API implementation to Apache Zookeeper for Python clients'
arch=('any')
url="https://github.com/python-zk/${_appname}"
license=('Apache')
makedepends=('python-pygments' 'python2-sphinx' 'python-jinja')
source=(${_appname}-${pkgver}.tgz::https://github.com/python-zk/${_appname}/archive/${pkgver}.tar.gz)
sha256sums=('075b459283c739632271b7ea5a004aa93ac9285631a17465014fe7c942e96dbc')

build() {
  cd "${srcdir}/${_appname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_appname}-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}"
}
