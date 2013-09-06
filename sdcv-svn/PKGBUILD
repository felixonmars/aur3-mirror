# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Gu, Cong <gucong43216@gmail.com>
pkgname=sdcv-svn
pkgver=38
pkgrel=2
pkgdesc="StarDict Console Version"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/index.php"
license=('GPL')
depends=('glib2' 'readline' 'zlib')
makedepends=('subversion')
provides=('stardict')
conflict=('sdcv')
#options=('!makeflags')
source=(sdcv-svn-order.patch)
md5sums=('abe5d80d3799e8b3d7922b0437c772c3')

_svnmod="sdcv"
_svntrunk="https://sdcv.svn.sourceforge.net/svnroot/sdcv/trunk"
                    
build() {
  cd ${srcdir}

  #####
  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    cd ${_svnmod} && svn up -r ${pkgver}
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  #####

  autoreconf --install
  ./configure --prefix=/usr  --mandir=/usr/share/man
#quick fix for x86_64 (zeus)
  if [ "${CARCH}" == "x86_64" ]; then
    sed -i 's|guint32 page_size|guint64 page_size|' src/lib/lib.cpp
  fi

  patch -Np1 -i ${srcdir}/$pkgname-order.patch || return 1

  make || return 1
}

package() {
  cd ${srcdir}/${_svnmod}
  make DESTDIR=${pkgdir} install
}
