pkgname=blipy
pkgver=0.1
pkgrel=1
pkgdesc="A Python API for blip.pl"
arch=(i686 x86_64)
url="http://github.com/patrys/blipy"
license=('LGPL')
depends=('python')
source=(http://bluez-python.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
source=(http://github.com/downloads/patrys/blipy/${pkgname}-${pkgver}.tar.gz)
md5sums=('3cd244f93b8374af7ac77aebf5a79179')

build() {
	  cd $startdir/src/$pkgname-${pkgver}
		  python setup.py install --root=$startdir/pkg
		}
