#Maintainer: max-k <max-k AT post DOT com>

pkgname=pear-channel-guzzlephp
pkgver=1
pkgrel=1
pkgdesc='Guzzle PEAR channel'
arch=('any')
url="http://guzzlephp.org/pear"
license=('MIT')
depends=('php-pear')
options=('!strip')
source=(http://guzzlephp.org/pear/channel.xml)
md5sums=('b4102c294299fd3e89a770c2ae2f3204')

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

