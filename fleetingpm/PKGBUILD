# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=fleetingpm
pkgver=2.8.1
pkgrel=1
pkgdesc="Fleeting Password Manager is a program that generates pseudo-random passwords from given master password, URL/ID and user name."
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/fleetingpm/'
license=('GPL3')
depends=('qt5')
makedepends=('cmake')
source=("http://sourceforge.net/projects/$pkgname/files/src/$pkgname-$pkgver.tar.gz")
md5sums=('30b21c6094dffeb84698ba93c905dfbb')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure -DUseQt5=1
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
} 
