# Maintainer: Sean Greenslade <zootboysean @ gmail . com>

pkgdesc='Tool to download/boostrap the ROS stack'
url='http://www.ros.org/'

pkgname='python2-rosinstall'
pkgver='0.7.5'
pkgrel='1'
arch=('any')
license=('BSD')
depends=('python2' 'cmake' 'python2-vcstools' 'python2-wstool'
         'python2-rosdistro' 'git' 'python2-yaml')

source=("http://download.ros.org/downloads/rosinstall/rosinstall-$pkgver.tar.gz")

build() {
  cd "${srcdir}/rosinstall-${pkgver}"
  sed -i 's/env python /env python2 /' src/rosinstall/setupfiles.py
}
package() {
  cd "${srcdir}/rosinstall-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}
md5sums=('7824a968e98f6ed79ddd0740c8fe5035')
