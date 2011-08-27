# Maintainer: Thomas S Hatch <thatch45@gmail.com>
pkgname=ruby1.8-shadow
pkgver=1.4.1
pkgrel=1
pkgdesc="Interface for shadow passwords for Ruby 1.8"
arch=(i686 x86_64)
depends=('ruby1.8')
license=('publicdomain')
url=('http://ttsky.net/')
replaces=(ruby-shadow)
source=("http://ttsky.net/src/ruby-shadow-$pkgver.tar.gz")
md5sums=('425b742ac43bff359c1717360f761790')

build() {
	cd $srcdir/shadow-$pkgver
	ruby-1.8 extconf.rb
	make
}

package() {
	cd $srcdir/shadow-$pkgver
	make DESTDIR=$pkgdir install
}
