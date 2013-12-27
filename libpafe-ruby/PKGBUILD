# Maintainer: mugifly <mp at ohgita dot info>
pkgname=libpafe-ruby
pkgver=0.0.8
pkgrel=1
pkgdesc="A library using the libpafe on ruby"
arch=('any')
url="http://homepage3.nifty.com/slokar/pasori/libpafe-ruby.html"
license=('GPL2')
depends=('libpafe' 'ruby')
source=("http://homepage3.nifty.com/slokar/pasori/$pkgname-$pkgver.tar.gz")
md5sums=('df5edc0b743191ccfc911d0178aedc65')

build() {
	cd "$srcdir/$pkgname"
	ruby extconf.rb
	make $MAKEFLAGS
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
