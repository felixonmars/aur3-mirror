#Maintainer: max-k <max-k AT post DOT com>

pkgname=pear-channel-aws
pkgver=1
pkgrel=1
pkgdesc='Amazon Web Services PEAR Channel'
arch=('any')
url="http://pear.amazonwebservices.com/"
license=('APACHE')
depends=('php-pear')
options=('!strip')
source=(http://pear.amazonwebservices.com/channel.xml)
md5sums=('4c6820d314fd005212fcd46192302de7')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} channel-add channel.xml
  rm ${_PEARDIR}/{.depdb*,.filemap,.lock}
  rm -r ${_PEARDIR}/.channels/{__uri.reg,*.php.net*}
  rm ${_PEARDIR}/.channels/.alias/{pear.txt,pecl.txt,phpdocs.txt}
  rm -r ${_PEARDIR}/.registry/{.channel.__uri,.channel.*.php.net}
}

