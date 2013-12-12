#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - A node for publishing joint angles, either through a gui, or with default values."
url='http://www.ros.org/'

_name=joint_state_publisher
pkgname=ros-groovy-joint-state-publisher
pkgver=1.9.36
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')
depends=('ros-groovy-rospy'
         'ros-groovy-sensor-msgs'
         'wxpython')
_dir=robot_model
# WARNING: currently using hydro-devel branch since the groovy-devel one is not
# operational, and there is no release branch on GitHub.
source=("$_dir"::"git://github.com/ros/robot_model.git"#branch=hydro-devel)
md5sums=('SKIP')

build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}/joint_state_publisher
    cmake ${srcdir}/${_dir}/joint_state_publisher \
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
