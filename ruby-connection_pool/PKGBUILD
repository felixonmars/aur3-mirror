# Maintainer: Guten Ye

_gemname=connection_pool
pkgname=ruby-$_gemname
pkgver=0.9.2
pkgrel=1
pkgdesc="Generic connection pool for Ruby"
arch=('any')
url="https://github.com/mperham/connection_pool"
license=('unknown')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

md5sums=('8fe7c2f85d8cc87d626c201890a65af2')
