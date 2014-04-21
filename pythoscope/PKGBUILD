# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=pythoscope
pkgver=0.4.3
pkgrel=2
pkgdesc="A python unit test generator."
arch=('i686' 'x86_64')
url="http://pythoscope.org/start"
license=('MIT')
depends=('python' 'setuptools')
source=("http://pythoscope.org/local--files/download/pythoscope-$pkgver.tar.gz")
md5sums=('15ddb693097375002fecd343d305f17f')



build() {
  cd $srcdir/pythoscope-$pkgver
  python2 setup.py install --root $pkgdir || return 1
}
