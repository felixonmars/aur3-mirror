#Contributor : Adam Strauch <creckx@gmail.com>
pkgname=ll-core
pkgver=1.9.1
pkgrel=1
pkgdesc="Python modul for running dameons, work with cron and other.."
url="http://www.livinglogic.de/Python/core/index.html"
license=("gpl")
arch=('i686')
depends=('python')
makedepends=('')
conflicts=()
replaces=()
backup=()
install=
source=("http://ftp.livinglogic.de/core/$pkgname-$pkgver.tar.bz2")
md5sums=('7f157414337bd2448bf4d37b2c95623a')

build() {
	cd $startdir/src/$pkgname-$pkgver
	python setup.py install --root=$startdir/pkg
}

