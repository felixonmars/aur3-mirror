pkgname=qtd-svn
pkgver=307
pkgrel=1
pkgdesc="Bindings of Qt GUI library to D programming language"
arch=('i686')
url="http://www.dsource.org/projects/qtd"
license=("Boost")
depends=('dmd' 'libtango' 'qt')
makedepends=('svn')
provides=('qtd')
conflicts=('qtd')

_svntrunk=http://svn.dsource.org/projects/qtd/trunk/
_svnmod=qtd

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting ant build process..."
  
  cd $_svnmod 
  
  mkdir build_dir
  cd build_dir

  cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
  make || return 1
  DESTDIR=${pkgdir} make install
  
}
