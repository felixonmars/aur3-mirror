# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=gromlist
pkgver=0.3.2
pkgrel=2
pkgdesc="A graphical ROM file manager based on PyGTK"
arch=('any')
url="http://mundogeek.net/$pkgname/"
license=('GPL')
depends=('pygtk')
install=$pkgname.install
source=($url/releases/$pkgname-$pkgver.tar.gz)
md5sums=('720b426ec96c5d80c3ab00e20a21b092')

build() {
  cp -rf $pkgname-$pkgver/usr/ "$pkgdir"/
}
