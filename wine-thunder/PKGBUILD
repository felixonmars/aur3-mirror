pkgname=wine-thunder
pkgver=0.6.2
pkgrel=2
pkgdesc="A p2sp client running on wine."
arch=('any')
url="http://forum.ubuntu.org.cn/viewtopic.php?&t=257448"
license=('custom')
depends=('wine')
optdepends=('wqy-mircrohei')
source=(http://wine-packages.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('945170bfc5c174ed510c81989be99646')

build(){
  cd $srcdir
  mv usr/ $pkgdir
}
