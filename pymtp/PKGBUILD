# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Megan Macinkowicz <violagirl23@gmail.com>

pkgname=pymtp
pkgver=0.0.4
pkgrel=2
pkgdesc="LibMTP bindings in Python"
arch=('i686' 'x86_64')
url="http://nick125.com/projects/pymtp/"
license=('GPL')
depends=('libmtp>=0.2.6' 'python2')
install=pymtp.install
source=(http://downloads.nick125.com/projects/pymtp/pymtp-latest.tar.bz2)
md5sums=('5eff39cbcc2e073228df04fe1ab1fce8')

build()
{
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py build
	python2 setup.py install --root=$pkgdir/
}
