# Maintainer: Simon K <simon@booya.at>
pkgname="hexblocker"
pkgver=r130.d27b000
pkgrel=1
pkgdesc="Helper Program for OpenFoams BlockMesh"
arch=('i686' 'x86_64')
url="https://github.com/nicolasedh/hexBlocker"
license=('GPL')
depends=('qt4')
makedepends=('git' 'qt4-private-headers' 'cmake' 'libxt')
source=("$pkgname::git+https://github.com/nicolasedh/hexBlocker")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname/src"
  cmake .
  make

}

package() {
  cd "$pkgname/src"
#cd $baseDir
#mkdir -p $hexBuild
#cd $hexBuild 
#cmake \
#    -DVTK_DIR=$vtkInstall/lib/vtk-5.10\
#    -DQT_QMAKE_EXECUTABLE=$QMAKE \
#    -DQT_MOC_EXECUTABLE=$MOC \
#    -DQT_UIC_EXECUTABLE=$UIC \
#    -DCMAKE_INSTALL_PREFIX=$hexBin \
#    $hexSRC || (echo "error in cmake for hexBlocker";exit 1)
#
#make -j $nprocs || (echo "error in make for hexBlocker";exit 1)

make install DESTDIR=$pkgdir
  #mv images/xflr5_128.png $pkgdir/usr/share/icons/hicolor/128x128/
 # ./install.sh
}
