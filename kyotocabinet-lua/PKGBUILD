# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
pkgname=kyotocabinet-lua
pkgver=1.28
pkgrel=1
pkgdesc="Lua bindings for Kyoto Cabinet."
arch=('i686' 'x86_64')
url="http://fallabs.com/kyotocabinet/"
license=('GPL3')
depends=('kyotocabinet>=1.2.34' 'lua')
source=(http://fallabs.com/kyotocabinet/luapkg/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
sha512sums=('37fd3f7838e13e2757d289eab98bf31fffe81f84838c18015cd060bf9ce7f93c5980ec72ac6ef6539d33eedf0eddf86c363bb5fac1688a6c01fc0a851da47024')
