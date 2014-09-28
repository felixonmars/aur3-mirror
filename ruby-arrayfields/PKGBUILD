# Maintainer: Alireza Savand <alireza.savand@gmail.com>

_gemname=arrayfields
pkgname=ruby-$_gemname
pkgver=4.9.2
pkgrel=1
pkgdesc='arrayfields'
arch=(any)
url='https://github.com/ahoward/arrayfields'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e9ca57a48b1adddadd88c20cb7d9aadb63153f9b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
