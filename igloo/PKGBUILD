# Contributor: chiku <chirantan DOT mitra AT gmail DOT com>

pkgname=igloo
pkgver=1.1.1
pkgrel=1
pkgdesc='A framework for unit testing in C++'
url='http://igloo-testing.org/'
arch=('any')
license=('Boost')
source=("https://github.com/joakimkarlsson/$pkgname/archive/$pkgname.$pkgver.zip")
md5sums=('c63f2c6cc47bd922197ae65acc8ef85a')

package() {
  cd "$pkgname-$pkgname.$pkgver"
  for file in $(find $pkgname -type f -name *.h)
  do
  	install -Dm 644 $file $pkgdir/usr/include/$file
  done
  install -Dm 644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
