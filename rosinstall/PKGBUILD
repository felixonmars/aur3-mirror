# Maintainer: Georg Bremer <pkgbuild@dschoordsch.de>

pkgdesc='Tool to download/boostrap the ROS stack'
url='http://www.ros.org/'

pkgname='rosinstall'
pkgver='0.7.3'
pkgrel='1'
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'cmake' 'wget' 'python2-vcstools'
  'git' 'python2-distribute' 'python2-yaml' 'python2-wstool')
optdepends=('python2-catkin_pkg: for roslocate'
'python2-rosdistro: for roslocate')
source=("http://download.ros.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('59919fcf9a9163ca3f62e065e4cf7d7a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/env python /env python2 /' src/rosinstall/setupfiles.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}
