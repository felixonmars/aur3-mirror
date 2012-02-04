# Contributor: farid farid@archlinux-br.org

pkgname=ramenhdr
pkgver=143
pkgrel=1
pkgdesc="Node based video compositor"
url="http://ramenhdr.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt' 'glew' 'boost' 'libpng' 'libjpeg' 'libtiff' 'fftw' 'openexr' 'ilmbase' 'intel-tbb')
makedepends=('subversion' 'cmake')
source=()
md5sums=()

_svntrunk=svn://scribus.info/Scribus/trunk svn co https://ramenhdr.svn.sourceforge.net/svnroot/ramenhdr/trunk
_svnmod=ramenhdr

build() {
  cd ${startdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  #cp -r $_svnmod $_svnmod-build
  #cd $_svnmod-build
  echo 'cmake dir is $_svnmod-build'
  
  cd ./trunk/
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${pkgdir} install

  rm -rf ${srcdir}/$_svnmod-build
}
