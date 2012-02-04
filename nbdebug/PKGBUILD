pkgname=nbdebug
pkgver=1.0
pkgrel=1
pkgdesc="Debug tool"
arch=('i686' 'x86_64')
license=('GPL')
url="http://projects.nickblundell.org.uk/packages/"
depends=('setuptools' 'python>=2.5')
source=(http://www.nickblundell.org.uk/packages/$pkgname-$pkgver.tar.gz)
md5sums=('45dcbb6be572303bec400ebd122ba7e1')

build() {
    cd $startdir/src/$pkgname-$pkgver
    python setup.py install --root=$startdir/pkg || return 1
}
