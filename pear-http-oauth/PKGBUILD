#Maintainer: max-k <max-k AT post DOT com>

pkgname=pear-http-oauth
_pkgname=HTTP_OAuth
pkgver=0.3.1
pkgrel=2
pkgdesc='PEAR implementation of the OAuth 1.0a specification.'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('BSD2')
depends=('php>=5.1.2')
makedepends=('php-pear>=1.4.0' 'pear-http-request2>=0.5.1')
optdepends=('pear-log' 'pear-cache-lite' 'pecl-http>=1.6.0')
options=('!strip')
install="${pkgname}.install"
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz
        pear-http-oauth.install)
md5sums=('6e70ba95494c448ace2a721af23448d9'
         'a0cd1f3250806d2f1691682179df4e92')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry}
}

