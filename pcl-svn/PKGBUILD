# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hauptmech 
# Contributor: figo.zhang

pkgname=pcl-svn
_pkgname=pcl
pkgver=5757
pkgrel=1
pkgdesc="A comprehensive open source library for n-D Point Clouds and 3D geometry processing"
arch=('x86_64' 'i686')
url='http://www.ros.org/wiki/pcl/'
license=('BSD')
conflicts=('pcl')
depends=('flann' 'vtk' 'qhull')
optdepends=('openmpi' 'cuda-toolkit' 'openni-git')
makedepends=('cmake' 'eigen3' 'boost' 'openni-git')

_svntrunk="http://svn.pointclouds.org/pcl/trunk"
_svnmod="$_pkgname"

build() {
    cd $srcdir

    if [ -d $_svnmod/.svn ]; then
          (cd $_svnmod && svn up -r $pkgver)
    else
          svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    find . -name *.cu | xargs sed -i '1 i #undef _GLIBCXX_USE_INT128'
    find . -name *.cu | xargs sed -i '1 i #undef _GLIBCXX_ATOMIC_BUILTINS'

    cd $srcdir/$_svnmod
    [[ -d build ]] && rm -rf build
    mkdir -p build && cd build

    export CUDA_BIN_PATH=/opt/cuda-toolkit
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_CUDA=ON \
        -DBUILD_GPU=ON \
        -DBUILD_gpu_surface=ON \
        -DBUILD_gpu_people=ON \
        -DBUILD_gpu_tracking=ON \
        -DBUILD_simulation=OFF

    make
}

package() {
  cd $srcdir/$_svnmod/build

  make DESTDIR=$pkgdir install

  install -Dm644 ../LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

