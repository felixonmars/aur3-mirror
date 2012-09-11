# Maintainer: Guten Ye

_gemname=pd
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc="some helper methods to help debuging"
arch=('any')
url="http://github.com/GutenYe/pd"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

md5sums=('0d7871213e383fbfae3058fa7e5a530f')
