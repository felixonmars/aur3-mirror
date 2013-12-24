#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Components of MoveIt! that offer simpler interfaces to planning and execution."
url='http://www.ros.org/'

pkgname=ros-groovy-moveit-ros-planning-interface
pkgver=0.4.6
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'cmake')
depends=('python2'
         'ros-groovy-actionlib'
         'ros-groovy-eigen-conversions'
         'ros-groovy-moveit-ros-manipulation'
         'ros-groovy-moveit-ros-move-group'
         'ros-groovy-moveit-ros-planning'
         'ros-groovy-moveit-ros-warehouse'
         'ros-groovy-rosconsole'
         'ros-groovy-roscpp'
         'ros-groovy-rospy'
         'ros-groovy-tf'
         'ros-groovy-tf-conversions')
_dir=moveit_ros
_subdir=planning_interface
source=("$_dir"::'git://github.com/ros-planning/moveit_ros.git'#branch=groovy-devel)
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
