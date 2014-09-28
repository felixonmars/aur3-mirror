# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=elasticsearch-api
pkgname=ruby-$_gemname
pkgver=1.0.5
pkgrel=1
pkgdesc='Ruby API for Elasticsearch.'
arch=(any)
url='https://github.com/elasticsearch/elasticsearch-ruby/tree/master/elasticsearch-api'
license=('Apache 2')
depends=(ruby ruby-multi_json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0eec3cc7b3e24082c5a0de2b7da7934f543f61de')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
