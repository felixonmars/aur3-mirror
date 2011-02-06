# Contributor & Maintainer: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=wv2-svn
pkgver=45
pkgrel=1
pkgdesc="WvWare is a library that can parse MSWord files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wvware/"
depends=('libgsf')
provides=('wv2=0.4.2.99')
conflicts=('wv2')
options=(!libtool)
source=()
license=('GPL2')
md5sums=()

_svntrunk=https://wvware.svn.sourceforge.net/svnroot/wvware/wv2-trunk
_svnmod=wv2-trunk

build() {
  if [ -d $_svnmod/.svn ]; then
     (cd $_svnmod && svn up)
  else
     svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
              
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
                  
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  rm -rf ${srcdir}/${_svnmod}-build  
}
