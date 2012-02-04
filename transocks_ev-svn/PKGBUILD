# Contributor: Patrick Stewart <patstew at gmail dot com>
pkgname=transocks_ev-svn
pkgver=5
pkgrel=1
pkgdesc="Allows transparent SOCKS proxying for all applications through iptables"
arch=('i686' 'x86_64')
url="http://oss.tiggerswelt.net/transocks_ev/"
license=('custom:"creative commons attribution-share alike 3.0 germany"') # http://creativecommons.org/licenses/by-sa/3.0/de/legalcode
depends=('iptables' 'libevent')
makedepends=('subversion')
backup=('etc/conf.d/transocks')
source=('transocks' 'transocks.conf.d' 'http://creativecommons.org/licenses/by-sa/3.0/de/legalcode')

_svnmod=transocks_ev
_svntrunk=http://oss.tiggerswelt.net/${_svnmod}/

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_svnmod"

  make clean || return 1
  make || return 1
  install -Dm755 transocks_ev ${pkgdir}/usr/bin/transocks_ev || return 1
  install -Dm755 ../transocks ${pkgdir}/etc/rc.d/transocks || return 1
  install -Dm644 ../transocks.conf.d ${pkgdir}/etc/conf.d/transocks || return 1
  install -Dm644 ../legalcode ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.htm || return 1
}
md5sums=('bc7233ceccd5ddceb07624ac3073e65c'
         'd82576d9c8d484b6270665cd0af2f934'
         '48f13874ca8b14eb71a2bfc465a5d7ff')
