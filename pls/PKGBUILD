# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=pls
pkgver=23.9218668
pkgrel=1
pkgdesc="Pacman Log Search. A python module, see https://github.com/wifiextender/pacman_log_search for example usage."
arch=('any')
url="https://github.com/wifiextender/pacman_log_search"
license=('GPL3')
depends=('python3')
makedepends=('git')
source=('git+https://github.com/wifiextender/pacman_log_search.git')
md5sums=('SKIP')

package() {
  cd $srcdir/pacman_log_search

  # Program
  sudo python3 setup.py install

}

pkgver() {
  cd $srcdir/pacman_log_search
  echo $(git rev-list --count master).$(git rev-parse --short master)
}