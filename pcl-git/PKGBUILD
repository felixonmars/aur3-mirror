# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hauptmech 
# Contributor: figo.zhang

pkgname=pcl-git
_pkgname=pcl
pkgver=20130527
pkgrel=1
pkgdesc="A comprehensive open source library for n-D Point Clouds and 3D geometry processing"
arch=('x86_64' 'i686')
url='http://www.pointclouds.org/'
license=('BSD')
conflicts=('pcl')
depends=('flann' 'vtk' 'qhull')
makedepends=('cmake' 'eigen3' 'boost' 'openni2')
optdepends=('openmpi' 'cuda' 'openni2')
source=(git://github.com/PointCloudLibrary/pcl.git)
sha1sums=('SKIP')

build() {
    cd $srcdir/pcl

    #find . -name *.cu | xargs sed -i '1 i #undef _GLIBCXX_USE_INT128'

    [[ -d build ]] && rm -rf build
    mkdir -p build && cd build

    #export CUDA_BIN_PATH=/opt/cuda
    # -DBUILD_gpu_people=OFF \ Disable until CUDA npp detection is fixed in cmake
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_CUDA=ON \
        -DBUILD_cuda_io=ON \
        -DBUILD_cuda_apps=ON \
        -DBUILD_GPU=ON \
        -DBUILD_gpu_surface=ON \
        -DBUILD_gpu_tracking=ON \
        -DBUILD_apps=ON \
        -DBUILD_app_3d_rec_framework=ON \
        -DBUILD_app_cloud_composer=ON \
        -DBUILD_app_in_hand_scanner=ON \
        -DBUILD_app_modeler=ON \
        -DBUILD_app_point_cloud_editor=ON \
        -DBUILD_examples=ON \
        -DBUILD_global_tests=ON \
        -DBUILD_simulation=ON \
        -DBUILD_surface_on_nurbs=ON

    make
}

package() {
  cd $srcdir/pcl/build

  make DESTDIR=$pkgdir install

  install -Dm644 ../LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

