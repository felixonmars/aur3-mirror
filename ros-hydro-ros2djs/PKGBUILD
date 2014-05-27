pkgdesc="ROS - 2D Visualization Library for use with the ROS JavaScript Libraries."
url='http://wiki.ros.org/ros2djs'

pkgname='ros-hydro-ros2djs'
pkgver='2'
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('nodejs-grunt-cli')
depends=('nodejs' 'phantomjs' 'eventemitter2' 'ros-hydro-roslibjs')

_tag=r${pkgver}
_dir=ros2djs
source=("${_dir}"::"git+https://github.com/RobotWebTools/ros2djs.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_dir}/utils

  # Install the Grunt tasks specific to this project
  npm install .

  # Build project
  grunt build
}

package() {
  cd ${srcdir}/${_dir}/build

  mkdir -p $pkgdir/opt/ros/hydro/share/ros2djs

  for file in $(find . -name '*.js' -print); do
    install -m644 -D $file $pkgdir/opt/ros/hydro/share/ros2djs/
  done
}
