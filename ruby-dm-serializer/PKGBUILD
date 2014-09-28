# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=dm-serializer
pkgname=ruby-$_gemname
pkgver=1.2.2
pkgrel=1
pkgdesc='DataMapper plugin for serializing Resources and Collections'
arch=(any)
url='http://datamapper.org'
license=()
depends=(ruby ruby-fastercsv ruby-multi_json ruby-json ruby-json_pure ruby-dm-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('d8f7cd1827bb1dec6f1e2c555d726e5de971dea0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
