# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.4.1
pkgrel=1
pkgdesc="Libalpm bindings for Python 3"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/users/remy/pyalpm.git/"
license=('GPL')
depends=('python>=3.2' 'pacman<3.6')
source=("ftp://ftp.archlinux.org/other/pyalpm/$pkgname-$pkgver.tar.gz")
md5sums=('a77f417bb65f5c2de28c46066b45fa18')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}

