#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="ROS - Python URDF parser."
url='http://www.ros.org/'

pkgname=ros-groovy-urdf-parser-py
pkgver=0.2.9
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')
depends=('ros-groovy-rospy' 'python2')
md5sums=('SKIP')

_name=urdfdom
_dir=${_name}
source=("$_dir"::"git://github.com/ros/${_name}.git"#tag=${pkgver})

# Subdirectory that will be installed
_subdir="urdf_parser_py"

build() {
    /usr/share/ros-build-tools/fix-python-scripts.sh "${srcdir}/${_dir}/${_subdir}"

    cd "${srcdir}/${_dir}/${_subdir}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_dir}/${_subdir}"
    python2 setup.py install --prefix /opt/ros/groovy --skip-build --root "${pkgdir}"
}

