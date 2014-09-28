# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=map
pkgname=ruby-$_gemname
pkgver=6.5.5
pkgrel=1
pkgdesc='map'
arch=(any)
url='https://github.com/ahoward/map'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('7ed76265b442883cdd90d65367bfe0b192052c91')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
