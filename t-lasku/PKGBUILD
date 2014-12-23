# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.22.0
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('i686' 'x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt5-base' 'qt5-script')
optdepends=('postgresql-libs')
install='t-lasku.install'
if test "$CARCH" == x86_64; then
  source=(http://helineva.net/t-lasku/t-lasku-1.22.0-amd64.tar.gz)
  sha1sums=('32e6b2d287ec614b6bd961a668a7c41d6f15d904')
else
  source=(http://helineva.net/t-lasku/t-lasku-1.22.0-i386.tar.gz)
  sha1sums=('4357cf66c4a64cc379b4c38b6f9b19a4916d0a59')
fi

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -lQt5Script -lQt5Sql -lQt5Xml -lQt5Gui -lQt5Widgets -lQt5PrintSupport -lQt5Core -lpthread -lstdc++     -o t-lasku t-lasku-relocatable
  gcc -lQt5Script -lQt5Sql -lQt5Xml -lQt5Gui -lQt5Widgets -lQt5PrintSupport -lQt5Core -lpthread -lstdc++     -o t-lasku-cli t-lasku-cli-relocatable
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
