# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=attr_required
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='attr_required and attr_optional'
arch=(any)
url='http://github.com/nov/attr_required'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0df7bceb8e14a98339443ad76bf217d09b219fff')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
