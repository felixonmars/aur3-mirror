#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url='http://www.ros.org/'

pkgname=ros-groovy-gazebo-plugins
pkgver=2.4.0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')
depends=('gazebo'
         'pcl-ros'
         'ogre-1.8'
         'ros-groovy-angles'
         'ros-groovy-cv-bridge'
         'ros-groovy-driver-base'
         'ros-groovy-dynamic-reconfigure'
         'ros-groovy-gazebo-msgs'
         'ros-groovy-geometry-msgs'
         'ros-groovy-image-transport'
         'ros-groovy-message-generation'
         'ros-groovy-nav-msgs'
         'ros-groovy-nodelet'
         'ros-groovy-pcl-conversions'
         'ros-groovy-polled-camera'
         'ros-groovy-rosconsole'
         'ros-groovy-roscpp'
         'ros-groovy-rospy'
         'ros-groovy-tf'
         'ros-groovy-trajectory-msgs')
md5sums=('SKIP')

_name=gazebo_ros_pkgs
_dir=${_name}
source=("$_dir"::"git://github.com/ros-simulation/${_name}.git"#tag=${pkgver})

# Subdirectory that will be installed
_subdir="gazebo_plugins"

build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build

    cd "${srcdir}/build/"
    /usr/share/ros-build-tools/fix-python-scripts.sh "${srcdir}/${_dir}/${_subdir}"

    # Adapt paths for Ogre 1.8
    export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"

    cmake ${srcdir}/${_dir}/${_subdir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/groovy \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DCMAKE_LIBRARY_PATH="/opt/OGRE-1.8/lib" \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

