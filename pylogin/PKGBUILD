# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=pylogin
pkgver=6.e9277f8
pkgrel=1
pkgdesc="Login module for your python app, see https://github.com/wifiextender/pylogin for example usage."
arch=('any')
url="https://github.com/wifiextender/pylogin"
license=('GPL3')
depends=('python3')
makedepends=('git')
source=('git+https://github.com/wifiextender/pylogin.git')
md5sums=('SKIP')

package() {
  cd $srcdir/pylogin

  # Program
  sudo python3 setup.py install

}

pkgver() {
  cd $srcdir/pylogin
  echo $(git rev-list --count master).$(git rev-parse --short master)
}