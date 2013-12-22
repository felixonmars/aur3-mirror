#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - PCL (Point Cloud Library) ROS interface stack."
url='http://www.ros.org/'
pkgname=ros-groovy-pcl
pkgver=1.0.36
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'ros-build-tools')
depends=('eigen3' 'pcl-ros' 'boost'
         'ros-groovy-catkin'
         'ros-groovy-dynamic-reconfigure'
         'ros-groovy-nodelet'
         'ros-groovy-nodelet-topic-tools'
         'ros-groovy-pcl-conversions'
         'ros-groovy-pcl-msgs'
         'ros-groovy-pluginlib'
         'ros-groovy-rosbag'
         'ros-groovy-roscpp'
         'ros-groovy-sensor-msgs'
         'ros-groovy-std-msgs'
         'ros-groovy-tf')
optdepends=('openni')

_dir=pcl_ros
source=("$_dir"::'git://github.com/ros-perception/perception_pcl.git'#branch=hydro-devel)
#source=("$_dir"::'git://github.com/ros-perception/perception_pcl.git'#tag=${pkgver})
md5sums=('SKIP')

build() {
    [ -f /opt/ros/groovy/setup.bash ] && source /opt/ros/groovy/setup.bash
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/${_dir}
    cmake ${srcdir}/${_dir}/pcl_ros \
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
