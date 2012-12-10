# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=tweeter
pkgver=1
pkgrel=1
pkgdesc="A small Perl script for updating your twitter status"
arch=('any')
url="http://www.dagertech.net/~gershman/software/tweeter/"
license=('GPL')
depends=('perl>=5.6.1')
source=(http://www.dagertech.net/~gershman/software/$pkgname/$pkgname.pl)
md5sums=('3899642a0663890e0ab70cc8113c9c6e')

build() {
  sed -i 's#/local##' $pkgname.pl
  install -Dm755 $pkgname.pl "$pkgdir/usr/bin/$pkgname"
}
