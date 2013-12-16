#Maintainer: max-k <max-k AT post DOT com>

pkgname=pear-http-request
_pkgname=HTTP_Request
pkgver=1.4.4
pkgrel=3
pkgdesc='Provides an easy way to perform HTTP requests.'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('BSD')
depends=('php>=4.2.0' 'pear-net-socket>=1.0.7' 'pear-net-url>=1.0.12')
makedepends=('php-pear>=1.4.3')
options=('!strip')
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz)
md5sums=('e7590ac0b912362b7ce85e247aefa8a6')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry/.chan*}
}

