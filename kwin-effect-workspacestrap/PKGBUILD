pkgname=kwin-effect-workspacestrap
pkgver=1.0.2
pkgrel=1
url="http://kde-apps.org/content/show.php/Workspace-Strap+Effect?content=143857"
pkgdesc="This is a KWin Effect that lets you organize your windows on a linear horizontal strap, that is bigger than your screen."
license=('GPL2')
arch=('i686' 'x86_64')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/143857-workspacestrap.tar.gz)
md5sums=('dac4ab7d346cb64fadb8c373fab4a71a')

build(){
cd ${srcdir}
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build 
  fi
  mkdir ${srcdir}/build
  cd ${srcdir}/build 
  cmake ${srcdir}/workspacestrap -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release
  make
}

package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
