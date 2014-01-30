# Maintainer: erwinkendo <erwinkendo@gmail.com>
# Contributor: hauptmech <hauptmech@gmail.com>
# Contributor: pallegro <hollense@cs.dal.ca>
_name=PCL
pkgname=pcl-ros
pkgver=1.7.0
pkgrel=1
pkgdesc="ROS - Point Cloud Library"
arch=('i686' 'x86_64')
url="http://pointclouds.org"
license=('GPL')
depends=('boost' 'eigen3' 'flann' 'vtk')
optdepends=('qhull' 'openni' 'cuda')
makedepends=('git' 'cmake' 'python2')
source=("$_name::git+https://github.com/ros-gbp/pcl-release/#branch=release/hydro/pcl")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_name}"
  mkdir build && cd build
  cmake ..  -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
            -DCMAKE_BUILD_TYPE=Release \
            -DSETUPTOOLS_DEB_LAYOUT=OFF \
            -DUSE_ROS=ON \
            -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
            -DPYTHON_VERSION_XDOTY:STRING=2.7
  make
}

package() {
  cd "$srcdir/${_name}/build"
  make DESTDIR="$pkgdir/" install
}
 
