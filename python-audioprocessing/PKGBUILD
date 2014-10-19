# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=python-audioprocessing
pkgver=0.0.7
pkgrel=1
pkgdesc="Python 2 modules and commandline tools to process and visualize audio signals"
arch=('any')
url="https://github.com/Rudd-O/python-audioprocessing"
license=('GPL3')
depends=('python2-scipy' 'python2-numpy' 'python2-matplotlib')
source=(https://github.com/Rudd-O/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('7a0907c205ed504fbf9aa562e6d51e31')


build() {
  cd $pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" --prefix=/usr
}
