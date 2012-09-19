# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

_gemname=nokogiri
pkgname=ruby-$_gemname-$pkgver
pkgver=1.5.0
pkgrel=1
pkgdesc="Nokogiri (é‹¸) is an HTML, XML, SAX, and Reader parser"
arch=('any')
url="http://nokogiri.org"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('91aef0c0d912554f0abfbd82666a0504')
sha1sums=('c82f210a45b7c6b87c681e79a29e6a08ec8c6d71')


package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
