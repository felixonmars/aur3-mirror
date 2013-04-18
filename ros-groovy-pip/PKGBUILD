pkgname="ros-groovy-pip"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Installs the non-packaged (pip) stuff necessary to bootstrap ROS."
url="http://www.ros.org"
license=('BSD')
arch=('any')
depends=('python2-pip')

package() {
	pip2 install -U rospkg rosdep rosinstall catkin-pkg wstool --install-option="--prefix=$pkgdir"
}

install="ros-groovy-pip.install"
