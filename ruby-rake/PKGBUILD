# Maintainer: Severen Redwood <severen.redwood@gmail.com>
# Contributors: Anatol Pomozov <anatol.pomozov@gmail.com>
#               Alfredo Palhares <masterkorp@masterkorp.net>

_gemname=rake
pkgname=ruby-$_gemname
pkgver=10.4.2
pkgrel=2
pkgdesc='Ruby based make-like utility.'
arch=(any)
url='http://github.com/rake/rake'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('abfbf4fe8d3011f13f922adc81167af76890a627')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
