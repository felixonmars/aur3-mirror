#Maintainer: max-k <max-k AT post DOT com>

pkgname=pear-net-url
_pkgname=Net_URL
pkgver=1.0.15
pkgrel=3
pkgdesc='Easy parsing of Urls'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('BSD')
depends=('php>=4.0.0')
makedepends=('php-pear>=1.4.0b1')
options=('!strip')
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz)
md5sums=('48a932688cde596b1cc5421ffbcea22f')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry/.chan*}
}

