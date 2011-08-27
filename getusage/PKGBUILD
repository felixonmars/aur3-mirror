# Maintainer: Simon Allen <its.simon.a@gmail.com>

pkgname=getusage
pkgver=1.8.1
pkgrel=1
pkgdesc="GetUsage allows you to check your internet quota usage on Telstra Bigpond."
arch=(i686 x86_64)
url="http://www.simonallen.org"
license=('GPL')
depends=('python2-qt' 'libnotify')
source=(http://simonallen.org/~simonall/src/python/getusage/getusage-1.8.1.tar.gz)
md5sums=('e223f427ec10539db72f004776256079')

build() {
	cd $srcdir/${pkgname}-${pkgname}
	sed -i '0,/python/s//python2/' src/getusage.py
	python2 setup.py install --root=/usr --root=$pkgdir/
}

