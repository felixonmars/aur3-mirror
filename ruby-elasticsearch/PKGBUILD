# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=elasticsearch
pkgname=ruby-$_gemname
pkgver=1.0.5
pkgrel=1
pkgdesc='Ruby integrations for Elasticsearch'
arch=(any)
url='http://github.com/elasticsearch/elasticsearch-ruby'
license=('Apache 2')
depends=(ruby ruby-elasticsearch-transport ruby-elasticsearch-api)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('36fd03bf8b417dbe7c3f9346345ea11619d942ea')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
