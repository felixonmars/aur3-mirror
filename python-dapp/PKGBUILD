# Maintainer: Guillaume Chanaud <gehasia at gmail dot com>

pkgname=python-dapp
pkgver=0.3.0
pkgrel=1
pkgdesc="Library implementing protocol used for communication between DevAssistant and PingPong scripts."
arch=('any')
url="http://devassistant.org"
license=('GPL2')
provides=('python-dapp')
depends=('python-six' 'python-yaml')
makedepends=('python-six' 'python-yaml')
source=(https://github.com/devassistant/dapp/archive/v$pkgver.tar.gz)
md5sums=('d6adf36896f0c916acf9c18611ae34fd')
package() {
  cd $srcdir/dapp-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir
}
