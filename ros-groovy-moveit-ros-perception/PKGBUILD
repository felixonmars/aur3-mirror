#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Components of MoveIt! connecting to perception."
url='http://www.ros.org/'

pkgname=ros-groovy-moveit-ros-perception
pkgver=0.4.6
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'cmake')
depends=('freeglut' 'glew' 'libgl' 'pcl-ros'
         'ros-groovy-image-transport'
         'ros-groovy-pcl'
         'ros-groovy-message-filters'
         'ros-groovy-moveit-core'
         'ros-groovy-octomap'
         'ros-groovy-opencv2'
         'ros-groovy-pcl-conversions'
         'ros-groovy-pluginlib'
         'ros-groovy-rosconsole'
         'ros-groovy-roscpp'
         'ros-groovy-tf'
         'ros-groovy-tf-conversions'
         'ros-groovy-urdf')
_dir=moveit_ros
_subdir=perception
source=("$_dir"::'git://github.com/ros-planning/moveit_ros.git'#branch=hydro-devel)
md5sums=('SKIP')


build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}/${_subdir}
    cmake ${srcdir}/${_dir}/${_subdir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
