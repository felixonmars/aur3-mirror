# Maintainer: Marco Londero <the.sonda90@gmail.com>

pkgname=adium-theme-ubuntu
pkgver=0.3.1
pkgrel=1
pkgdesc="Adium message style for Ubuntu"
arch=('i686' 'x86_64')
url="https://launchpad.net/adium-theme-ubuntu"
license=('GPL')
depends=('empathy' 'python-distutils-extra')
makedepends=()
source=(http://launchpad.net/$pkgname/trunk/0.3/+download/$pkgname-$pkgver.tar.gz)
md5sums=('1ec9c3fbd4fd46f55a07ae65a9b070d6')

build() {
   cd $srcdir/$pkgname-$pkgver

  python2 ./setup.py build
  python2 ./setup.py install --prefix=/usr --root=$pkgdir
}
