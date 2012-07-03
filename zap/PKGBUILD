# Contributor: Lex Rivera <x-demon@x-demon.org>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=zap
pkgver=5
pkgrel=2
pkgdesc="wireless performance test tool"                                                                                        
arch=('i686' 'x86_64')
url="http://code.google.com/p/zapwireless"
license=('BSD')
depends=()
makedepends=(subversion)
optdepends=()
conflicts=()
provides=()

_svntrunk="http://zapwireless.googlecode.com/svn/trunk/"
_svnmod="zap"


build() {
msg "Downloading from ${_svntrunk} ..."
  cd ${srcdir}
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
  rm -Rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

msg "Building and installing..."  
  make
  mkdir -p ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install

msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_svnmod}-build
}
