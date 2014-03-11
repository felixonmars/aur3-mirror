# Maintainer: Vivien Delmon <vivien.delmon@lrde.epita.fr> 
pkgname=vv
pkgver=20140310
pkgrel=2
pkgdesc="A fast and simple viewer for spatio-temporal images: 2D, 2D+t, 3D and 3D+t (or 4D) images"
arch=('i686' 'x86_64')
license=('BSD' 'CeCILL-B')
url="http://www.creatis.insa-lyon.fr/rio/vv/"
depends=('insight-toolkit>=4.0' 'vtk>=5.6' 'qt4>=4.4' 'gdcm')
makedepends=('git' 'cmake>=2.8' 'gengetopt>=2.20')
_gitroot='git://git.creatis.insa-lyon.fr/clitk'
_gitname='vv'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ]; then
    cd $_gitname
    git checkout master
    git pull
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi
  git checkout 'bf524e64011b3d10ce2ee7b86236e4c53efb8e5f'
  msg "Git checkout done."
  mkdir -p _build
  cd _build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/$_gitname/_build
  make DESTDIR=$pkgdir install
  rm -rf $srcdir/$_gitname/_build
}
