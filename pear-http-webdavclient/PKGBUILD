#Maintainer: max-k <max-k AT post DOT com>

pkgname=pear-http-webdavclient
_pkgname=HTTP_WebDAV_Client
pkgver=1.0.2
pkgrel=3
pkgdesc='WebDAV stream wrapper class'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('PHP')
depends=('php>=4.3.0' 'pear-http-request>=1.0')
makedepends=('php-pear>=1.4.0b1')
options=('!strip')
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz)
md5sums=('b5fd549a41d2f6ba06cb7010c9f15fab')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry/.chan*}
}

