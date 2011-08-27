# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=buildit
pkgver=1.1
pkgrel=3
pkgdesc="A make-like tool written in python"
arch=('i686')
url="http://www.agendaless.com/Members/chrism/software/buildit/"
license=('BSD')
depends=('python')
makedepends=('python')
source=("http://www.agendaless.com/Members/chrism/software/buildit/$pkgname-$pkgver.tar.gz")
md5sums=('f81e74779366f9065f456de326c04c7a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -D LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  python setup.py bdist_dumb || exit 1
  cd $startdir/pkg
  tar xzvf $startdir/src/$pkgname-$pkgver/dist/$pkgname-$pkgver.linux*.tar.gz	
}
