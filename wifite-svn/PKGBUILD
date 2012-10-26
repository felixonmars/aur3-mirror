# Maintainer: Erwann Traourouder <erwann dot traourouder at gmail dot com>
pkgname=wifite-svn
pkgver=85
pkgrel=3
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=(any)
url="http://code.google.com/p/wifite/"
license=('GPL')
depends=(python2 aircrack-ng aircrack-ng-scripts python2-pexpect)
optdepends=(tk macchanger pyrit-svn cowpatty reaver wireshark-cli)
makedepends=(subversion)

_svntrunk=http://wifite.googlecode.com/svn/trunk/
_svnmod=wifite

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' ${_svnmod}/wifite.py
  install -D -m755 ${_svnmod}/wifite.py ${pkgdir}/usr/bin/wifite
}
