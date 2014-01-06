#Maintainer: max-k <max-k AT post DOT com>

pkgname=symfony-event_dispatcher
_pkgname=EventDispatcher
pkgver=2.4.0
pkgrel=2
pkgdesc='Object-oriented PHP HTTP Client for PHP 5.3+'
arch=('any')
url="http://symfony.com/doc/current/components/event_dispatcher/introduction.html"
license=('MIT')
depends=('php>=5.3.2' 'pear-channel-symfony2')
makedepends=('php-pear>=1.4.0')
options=('!strip')
noextract=(${_pkgname}-${pkgver}.tgz)
source=(http://pear.symfony.com/get/${_pkgname}-${pkgver}.tgz http://pear.symfony.com/channel.xml)
md5sums=('c7612f50b9101bb71876f5ecc0c9cff1'
         '23caa76bd3b1799367686c640f15c041')

package() {
  cd ${srcdir}
  local _PEARDIR="${pkgdir}/usr/share/pear"
  local _PEAROPTS="-D php_dir=${_PEARDIR} -D doc_dir=${_PEARDIR}/doc"
  local _PEAROPTS="${_PEAROPTS} -D test_dir=${_PEARDIR}/test"
  local _PEAROPTS="${_PEAROPTS} -D data_dir=${_PEARDIR}/data"
  pear ${_PEAROPTS} channel-add channel.xml
  pear ${_PEAROPTS} install -O -n ${_pkgname}-${pkgver}.tgz
  rm -r ${_PEARDIR}/{.channels,.depdb*,.filemap,.lock}
  rm -r ${_PEARDIR}/.registry/{.channel.__uri,.channel.*.php.net}
}

