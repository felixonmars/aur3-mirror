# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=ko-po-check
pkgver=0.90.3
pkgrel=1
pkgdesc="A tool to check Korean po files"
arch=('i686' 'x86_64')
url="http://kldp.net/projects/ko-po-check/"
license=('GPL3')
depends=('pyxml')
makedepends=('python')
provides=('ko-po-check')
source=(http://kldp.net/frs/download.php/5157/$pkgname-$pkgver.tar.gz)
md5sums=('85b4aab7610e4cadc1fb15c37dd3d6f3')
options=('!emptydirs')

build() {

  cd $srcdir/$pkgname-$pkgver

  python setup.py build
  python setup.py install --prefix=/usr --root=$pkgdir
}

