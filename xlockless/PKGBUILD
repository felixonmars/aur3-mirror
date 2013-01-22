pkgname=xlockless
pkgver=1.0
pkgrel=1
pkgdesc="A simple screen locker"
url="http://vault24.org/projects/xlockless/"
license=('LGPL')
depends=('libx11' 'pam')
arch=('i686' 'x86_64')
source=("http://vault24.org/projects/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ab065822a7a7a2a4410b8ea817a8d323')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  install -Dc $pkgname "${pkgdir}"/usr/bin/$pkgname
}
