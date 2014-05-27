
pkgdesc="ROS - The Standard ROS JavaScript Library."
url='http://wiki.ros.org/roslibjs'

pkgname='ros-hydro-roslibjs'
pkgver='6'
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('nodejs-grunt-cli')
depends=('nodejs' 'phantomjs' 'eventemitter2')

_tag=r${pkgver}
_dir=roslibjs
source=("${_dir}"::"git+https://github.com/RobotWebTools/roslibjs.git"#tag=${_tag})
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

  mkdir -p $pkgdir/opt/ros/hydro/share/roslibjs

  for file in $(find . -name '*.js' -print); do
    install -m644 -D $file $pkgdir/opt/ros/hydro/share/roslibjs/
  done
}
