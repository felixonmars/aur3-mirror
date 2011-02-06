# Contributor: Nick B <Shirakawasuna at gmail dot com>

pkgname=lalalove
pkgver=65
pkgrel=1
pkgdesc="A game where you have to make planets happy by creating music."
arch=('i686' 'x86_64')
url="http://ghoulsblade.schattenkind.net/wiki/index.php/Lalalove"
license=('GPL')
depends=('love05')
makedepends=('subversion')

_svntrunk=svn://zwischenwelt.org/lalalove/trunk
_svnmod=lalalove

build() {

  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir -p ${pkgdir}/usr/share
  cp -r $startdir/src/lalalove ${pkgdir}/usr/share/lalalove

  mkdir -p ${pkgdir}/usr/bin
  echo "#!/bin/bash" >> ${pkgdir}/usr/bin/lalalove
  echo "cd /usr/share/lalalove" >> ${pkgdir}/usr/bin/lalalove
  echo "love-05 ." >> ${pkgdir}/usr/bin/lalalove
  chmod 755 ${pkgdir}/usr/bin/lalalove

}
