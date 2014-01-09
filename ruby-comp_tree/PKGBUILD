
_gemname=comp_tree
pkgname=ruby-$_gemname
pkgver=1.1.3
pkgrel=1
pkgdesc='A parallel computation tree structure based upon concepts from pure functional programming.'
arch=(any)
url='http://quix.github.com/comp_tree'
license=(custom)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('43b41531ee62d2a0b7a1903a18b6d49636cf7a50')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
#  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
