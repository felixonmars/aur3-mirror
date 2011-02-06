# Maintainer: Nick Campbell <s0ma AT theangryfist DOT net>

pkgname=gloox-svn
pkgver=20091124
pkgrel=1
pkgdesc="XMPP client library written in C++"
arch=('i686' 'x86_64')
url="http://camaya.net/"
license=('GPL2')
depends=('gnutls' 'libidn')
optdepends=('')
makedepends=('setuptools' 'libtool' 'subversion')
source=()
md5sums=()

_svntrunk=svn://svn.camaya.net/gloox/trunk
_svnmod=gloox


build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn update)
  else
    svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build
  
  ./autogen.sh
  ./configure --prefix=/usr   
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

}
