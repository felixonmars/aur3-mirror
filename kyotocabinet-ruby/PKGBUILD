# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
pkgname=kyotocabinet-ruby
pkgver=1.32
pkgrel=1
pkgdesc="Ruby bindings for Kyoto Cabinet."
arch=('i686' 'x86_64')
url="http://fallabs.com/kyotocabinet/"
license=('GPL3')
depends=('kyotocabinet>=1.2.34' 'ruby')
source=(http://fallabs.com/kyotocabinet/rubypkg/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ruby extconf.rb
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
sha512sums=('c79a8ac4fe5b563b89274e644e756ebb33c6e21bcd471676f4fd97453ed9353bede357765d05f876cabdae01b9861cd50ce6c7769232beaa1dbc50236ee8845c')
