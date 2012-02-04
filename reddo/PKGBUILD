# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=reddo
pkgver=0.1.5
pkgrel=1
pkgdesc="A command line tool to translate any pair of languages"
arch=('i686' 'x86_64')
url="http://reddo.sourceforge.net/"
license=('GPL')
depends=('python')
source=(http://downloads.sourceforge.net/${pkgname}/$pkgname-$pkgver.tar.gz)
md5sums=('40d558b5b4e03006767516c9431856f1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build || return 1
  python setup.py install --root=${pkgdir}
}
