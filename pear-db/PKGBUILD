#Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>

pkgname=pear-db
_pkgname=DB
pkgver=1.7.14
pkgrel=1
pkgdesc='Provides a class to create MIME messages.'
arch=('any')
url="http://pear.php.net/package/${_pkgname}"
license=('BSD')
depends=('php>=4.3.0')
makedepends=('php-pear>=1.6.0')
options=('!strip')
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz)
md5sums=('b38357ad173a43e3c34e1b5527571fec')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock,.registry}
  sed "s@$pkgdir@@" -i $pkgdir/usr/share/pear/test/DB/tests/include.inc
  sed "s@$pkgdir@@" -i $pkgdir/usr/share/pear/test/DB/tests/driver/setup.inc
}
