# Contributor: lp76 <l.peduto@gmail.com>
pkgname=yagtd
pkgver=0.3.4
pkgrel=2
pkgdesc="A very simple utility designed to make the management of your to-do list quick and easy"
arch=('i686' 'x86_64')
url="https://gna.org/projects/yagtd/"
license=('GPL')
depends=('python2')
source=(http://download.gna.org/yagtd/$pkgname-$pkgver.tar.gz)
md5sums=('59e2305e2ea9fd0a4386fe96d3f0aeb5')
options=(!emptydirs)

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --prefix=$pkgdir/usr
}
