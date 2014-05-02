# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=python-login
pkgver=3.dc7c169
pkgrel=1
pkgdesc="Login-like module for your python program, see https://github.com/wifiextender/login for example usage."
arch=('any')
url="https://github.com/wifiextender/login"
license=('GPL3')
depends=('python3')
makedepends=('git')
source=('git+https://github.com/wifiextender/login.git')
md5sums=('SKIP')

package() {
  cd $srcdir/login

  # Program
  sudo python3 setup.py install

}

pkgver() {
  cd $srcdir/login
  echo $(git rev-list --count master).$(git rev-parse --short master)
}