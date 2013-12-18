#Maintainer: max-k <max-k AT post DOT com>

pkgname=pear-cache-lite
_pkgname=Cache_Lite
pkgver=1.7.15
pkgrel=1
pkgdesc='Provides a class to create MIME messages.'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('LGPL')
depends=('php>=4.0.0')
makedepends=('php-pear>=1.5.4')
options=('!strip')
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz)
md5sums=('646705e5857f9d539f72be5dcf6e39b8')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry}
}

