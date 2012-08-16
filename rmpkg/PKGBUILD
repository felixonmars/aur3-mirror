pkgname=rmpkg
pkgver=1.0.0
pkgrel=1
pkgdesc="This script's function is to search by name and remove packages with dependences"
arch=('any')
license=('GPL')
url=('https://github.com/protserovsd/Rmpkg')
depends=('yaourt' 'coreutils')
source=($pkgname)
md5sums=('6b8d2d6ef876973b9fd7cbbc6da70228')
build() {
  install -D -m755 ./$pkgname $pkgdir/usr/bin/$pkgname || return 1
}