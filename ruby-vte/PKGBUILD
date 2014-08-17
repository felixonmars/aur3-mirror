# Contributor: Nazarov Pavel <genocid@rambler.ru>
# Contributor: Joel aullidolunar @t gmail dot. c0m

_packagename=vte
pkgname=ruby-${_packagename}
pkgver=2.2.0
pkgrel=4
pkgdesc="Ruby bindings to VTE (gtk2)"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp/"
license=('LGPL')
depends=('ruby' 'ruby-gtk2' 'vte')
makedepends=('ruby-pkgconfig')
source=("http://softlayer-dal.dl.sourceforge.net/project/ruby-gnome2/ruby-gnome2/ruby-gnome2-$pkgver/ruby-gnome2-all-$pkgver.tar.gz")
sha1sums=('45d1bd38de78c320a562d3f3825f45077e26309f')

build() {
	cd "$srcdir/ruby-gnome2-all-$pkgver/vte"
	ruby extconf.rb
	make
}

package() {
	cd "$srcdir/ruby-gnome2-all-$pkgver/vte"
	make DESTDIR="$pkgdir" install
	install -Dm644 "COPYING.LIB" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
