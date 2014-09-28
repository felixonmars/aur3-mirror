# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=source_map
pkgname=ruby-$_gemname
pkgver=3.0.1
pkgrel=1
pkgdesc='Ruby support for source_maps (version 3)'
arch=(any)
url='http://github.com/ConradIrwin/ruby-source_map'
license=(MIT)
depends=(ruby ruby-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e6db57be9b35510d483a6e09e921f2bd8ecb39a8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
