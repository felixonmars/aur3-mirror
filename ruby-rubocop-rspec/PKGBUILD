# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=rubocop-rspec
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='Code style checking for RSpec files'
arch=(any)
url='http://github.com/nevir/rubocop-rspec'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b38ff22b1e90058cb132cd3d14cdbeaecacadb2d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE.md"
}
