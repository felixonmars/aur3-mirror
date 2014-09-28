# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=opal-jquery
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc='Opal access to jquery'
arch=(any)
url='http://opalrb.org'
license=()
depends=(ruby ruby-opal)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('aa63f0ec335849cbcce62f36e8ccf0253adce86e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
