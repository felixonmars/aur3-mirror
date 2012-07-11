# Maintainer Alfredo Palhares <masterkorp@masterkorp,net>

_gemname=cucumber-chef
pkgname=ruby-$_gemname
pkgver=1.0.3
pkgrel=1
pkgdesc="Tests Chef-built infrastructure"
arch=('any')
url="http://cucumber-chef.org"
license=('Apache 2.0')
depends=(
  'ruby'
  'ruby-chef>=0.10.2'
  'ruby-fog>=0'
  'ruby-thor>=0'
  'ruby-net-scp>=0')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('7118f622d190077e53fff78129148ffd')
sha1sums=('c4242f33c9453774683d25c2390ec790d569f44c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
