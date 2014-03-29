# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=faraday_middleware-multi_json
pkgname=ruby-$_gemname
pkgver=0.0.5
pkgrel=1
pkgdesc='MultiJson parser for Faraday'
arch=('any')
url='https://github.com/denro/faraday_middleware-multi_json'
license=('MIT')
depends=('ruby' 'ruby-faraday_middleware' 'ruby-multi_json-1.8')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('403595573a55cf2902fbbdee1cc2f3eff5e9a67d68e8111557a88f8b8471bcfa')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
