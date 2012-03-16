# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=selenium-grid
pkgver=1.0.8
pkgrel=1
pkgdesc="Transparently distribute your tests on multiple machines"
arch=('any')
url='http://selenium-grid.seleniumhq.org/'
license=('GPL')
depends=('java-environment' 'apache-ant')
source=("http://release.seleniumhq.org/${pkgname}/${pkgname}-${pkgver}-bin.zip")
md5sums=('b62f253269359e644e5e7917ef271295')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "${pkgdir}"/usr/share/java/selenium-grid
  cp -rf * "${pkgdir}"/usr/share/java/selenium-grid 
}
