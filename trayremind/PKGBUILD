#Maintainer: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=trayremind
pkgver=1.2.1
pkgrel=1
pkgdesc="A frontend to remind that lives in the system tray"
arch=(any)
url="http://randy.heydon.selfip.net/Programs/Trayremind/"
license=('CCPL:by-sa')
depends=('pygtk>=2.10' 'remind')
source=(http://pypi.python.org/packages/source/t/trayremind/$pkgname-$pkgver.tar.gz)
md5sums=('b12119f7900b6d113171ca1b986d850f')

build() {
	cd $srcdir/$pkgname-$pkgver
	python2 ./setup.py install --root=$pkgdir --optimize=1 || return 1
}
