# Maintainer: Abhijeet Rastogi (shadyabhi) <abhijeet.1989@gmail.com>
pkgname=meshprog
pkgver=0.1.1
pkgrel=1
pkgdesc="Meshnetics serial programmer for Linux"
arch=('i686' 'x86_64')
url="http://pervasive.researchstudio.at/portal/projects/meshprog"
license=('GPL')
depends=('glibc')
source=(http://pervasive.researchstudio.at/portal/files/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver" 
  make DESTDIR="$pkgdir/" install
}
md5sums=('096ac9d1165229e6689b8de58ca1baac')
