# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

_gemname=moneta
pkgname=ruby-$_gemname-0.7.0
pkgver=0.7.0
pkgrel=1
pkgdesc="A unified interface to key/value stores"
arch=('any')
url="http://www.yehudakatz.com"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('8c9022478d66f72557c9479ce33889f1')


package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}
