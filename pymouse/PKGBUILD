# Contributor: Hylix <hylix@gmail.com>
pkgname=pymouse
pkgver=0.5
pkgrel=1
pkgdesc="Cross-platform mouse control with Python"
url="http://github.com/pepijndevos/PyMouse/"
license="GPL"
arch=('i686' 'x86_64')
depends=('python')
makedepends=()
conflicts=('pymouse-git')
provides=('pymouse')
source=(http://cloud.github.com/downloads/pepijndevos/PyMouse/PyMouse$pkgver.tar.gz)
md5sums=(bcb67b148e66adb7e4211d5177944021)

build() {
 cd $startdir/src/pymouse
 python setup.py install --root=$startdir/pkg
 }
